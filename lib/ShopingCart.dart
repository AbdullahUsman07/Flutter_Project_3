import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  ShoppingCartState createState() => ShoppingCartState();
}

  List<String> favImagePaths = [];

class ShoppingCartState extends State<ShoppingCart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite Items',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      body: create_cart(), // Call create_cart directly
    );
  }

  Widget create_cart() {
    return favImagePaths.isEmpty
        ? const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text('Shopping Cart is Empty',
                  style: TextStyle(fontSize: 25.0)),
            ),
          )
        : Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Favourites',
                    style: TextStyle(color: Colors.grey[700], fontSize: 20.0),
                  ),
                  const SizedBox(height: 20.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < favImagePaths.length; i++)
                          SizedBox(
                            width: 100, // Set a fixed width for each item
                            child: addedItems(imagelocation: favImagePaths[i]),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget addedItems({required String imagelocation}) {
    return AspectRatio(
      aspectRatio: 2.6 / 3,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(imagelocation),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


}

  void addToFavourite({required String image}) {
    favImagePaths.add(image);
  }

  void removeFromFavourite({required String image}){
    favImagePaths.remove(image);
  }
