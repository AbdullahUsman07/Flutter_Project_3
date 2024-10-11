import 'package:flutter/material.dart';
import 'ShopingCart.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String foodItem = 'Pizza';
  
  // Creating map for boolean values they will keep record of individual items which are favourites or not

  Map <String, List<bool>> isYourFavourite={
    'Pizza':[false,false,false],
    'Burger':[false,false,false],
    'Pasta':[false,false,false],
    'Salad':[false,false,false],
    'Desert':[false,false,false],
  };
  
  

  // creating map for prices

   final Map <String, List<double>> itemPrice={
    'Pizza':[12.99,15.99,18.99],
    'Burger':[17.99,10.99,14.99],
    'Pasta':[11.69,13.99,11.99],
    'Salad':[7.99,6.99,7.50],
    'Desert':[5.99,4.66,3.99]
   };

  void _changeimage(String img) {
    setState(() {
      foodItem = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>ShoppingCart()),);
          }, icon: const Icon(Icons.shopping_basket))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food Delivery',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeCatogery(itemName: "Pizza"),
                        makeCatogery(itemName: "Burger"),
                        makeCatogery(itemName: "Pasta"),
                        makeCatogery(itemName: "Salad"),
                        makeCatogery(itemName: "Desert"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Free Delivery',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            createfoodlist(foodItem),
            
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }



  Widget makeCatogery({required String itemName}) {

    bool isSelected = (itemName==foodItem);

    return AspectRatio(
      aspectRatio:isSelected? 3.0: 2.0 / 1,
      child: Container(
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            color:isSelected? Colors.yellow[700]: Colors.white,
            borderRadius: BorderRadius.circular(26),
          ),
          child: MaterialButton(
            onPressed: () {
              _changeimage(itemName);
            
            },
            child: Align(
              child: Text(
                itemName,
                style: TextStyle(
                    color:isSelected? Colors.black: Colors.grey[700],
                    fontWeight: isSelected? FontWeight.bold: FontWeight.w100,
                    fontSize: 18),
              ),
            ),
          )),
    );
  }

  Widget makeImage({required String nameOfItem ,required String image,double? price,required bool isfavItem,required imageIndex}) {
    

    return AspectRatio(
        aspectRatio: 1 / 1.5,
        child: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(begin: Alignment.bottomCenter, colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.1),
                  ])),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(icon:Icon(Icons.favorite,
                        color:isfavItem?Colors.red:Colors.white),
                        onPressed: (){
                          setState(() {
                            //isfavItem[imageIndex]=!favItems[imageIndex];
                            isYourFavourite[nameOfItem]![imageIndex]=! isYourFavourite[nameOfItem]![imageIndex];
                            isYourFavourite[nameOfItem]![imageIndex]? addToFavourite(image: image): removeFromFavourite(image: image);
                          }
                        );
                        },)
                      ),
                      Column(children: [
                        Text(' \$ ${price.toString()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0)),
                      ])
                    ],
                  )),
            ),
          ),
        ));
  }

  Widget createfoodlist(String fooditem) {
    
    // if the item's prices are not defined assigned them as zeros
    List <double>? prices = itemPrice[fooditem]??[0.00,0.00,00.0];
    List <bool>? isFavourite=isYourFavourite[fooditem]??[false,false,false];
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              makeImage(nameOfItem: fooditem, image: "assets/images/$fooditem-1.jpg",price:prices[0],isfavItem:isFavourite[0],imageIndex:0),
              makeImage(nameOfItem: fooditem, image: "assets/images/$fooditem-2.jpg",price:prices[1],isfavItem:isFavourite[1],imageIndex:1),
              makeImage(nameOfItem: fooditem, image: "assets/images/$fooditem-3.jpg",price:prices[2],isfavItem:isFavourite[2],imageIndex:2),
            ],
          )),
    );
  }
}
