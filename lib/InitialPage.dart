import 'package:flutter/material.dart';

import 'OrderPage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Pizza-4.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.4),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text(
                'Taking Order For Delivery ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "See Resturants nearby by \n adding location",
                style: TextStyle(color: Colors.white,
                fontSize: 20.0),
              ),
              const SizedBox(height: 100.0,),
              Container(  
                width: double.infinity,
                decoration: BoxDecoration(  
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: const LinearGradient(colors: [
                    Colors.yellow,
                    Colors.orange,
                  ])
                ),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const OrderPage()),
                    );
                  },
                  child: const Text("Start",style: TextStyle(fontSize: 13.0),),),
              ),
              const SizedBox(height: 30,),
              const Align(
                child: Text('Now Delivering To Your Doorstep 24/7',style: TextStyle(color:Colors.white,fontSize: 15.0),),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
