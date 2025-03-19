import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_e_commerce_app/components/cart_provider.dart';
import 'package:provider/provider.dart';
import '../components/bottom_nav_bar.dart';
import '../components/custom_scaffold.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<String> productNames = ['Shirt 1','Shirt 2','Shirt 3','Shirt 4','Shirt 5'];
  List<int> quantities = [1,1,1,1,1];
  List<double> prices = [2.00,5.99,18.50,5.00,3.00];
  List<String> images = [
    'lib/assets/images/shirt1.png',
    'lib/assets/images/shirt2.png',
    'lib/assets/images/shirt3.png',
    'lib/assets/images/shirt4.png',
    'lib/assets/images/shirt5.png',
  ];

  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      quantities[index]--;
    });
  }

  double getCartTotal() {
    double total = 0.0;
    for(int i = 0; i < productNames.length; i++ ) {
      total += quantities[i] * prices[i];
    }
    return total;
  }

  void showCheckoutDialog () {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('CheckOut'),
            content: Text('Hurray! You have purchased the products successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  },
                child: Text('OK'),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = Provider.of<CartProvider>(context).cartItems;

    return CustomScaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('CART',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,),),
                Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: ((context,index) {
                        CartItem item = cartItems[index];
                        return Dismissible(
                          key: Key(productNames[index],),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {
                              productNames.removeAt(index);
                            });
                          },
                          background: Container(
                            color: Colors.red,
                            child: Icon(
                              Icons.cancel,
                              color: Colors.white,),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 16),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                    width: 50,
                                    child: Image.asset(
                                      images[index],
                                      height: 50,
                                      width: 50,
                                    )
                                ),
                                const SizedBox(width: 15,),
                                Column(
                                  children: [
                                    Text(
                                      // productNames[index],
                                      item.name,
                                      style: TextStyle(fontSize: 18),),
                                    Text(
                                      // '\$${prices[index]}',
                                      '\$${item.price}',
                                      style: TextStyle(fontSize: 16,color: Colors.grey),),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        decrementQuantity(index);
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(quantities[index].toString(),style: TextStyle(fontSize: 18),),
                                    IconButton(
                                      onPressed: () {
                                        incrementQuantity(index);
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text('Cart Total',style: TextStyle(fontSize: 18),),
                      SizedBox(width: 50,),
                      Text('\$${getCartTotal().toStringAsFixed(2)}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Expanded(
                      child: ElevatedButton(
                        onPressed: (){showCheckoutDialog();},
                        style: ElevatedButton.styleFrom(

                          backgroundColor: Colors.green,
                        ),
                        child: Text('Proceed to CheckOut',style: TextStyle(color: Colors.white),),
                      ),
                  ),
                ),
              ],
            ),
          )
      ),
      showBottomNavBar: true,
      initialIndex: 2,
    );
  }
}