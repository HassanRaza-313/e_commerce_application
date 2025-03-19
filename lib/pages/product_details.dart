import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/components/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentSlide = 0;
  int selectedButton = 2;

  void addToCart(){
    CartItem newItem = CartItem(name: 'Shirt', price: 18, quantity: 1);
    Provider.of<CartProvider>(context,listen: false).addToCart(newItem);
  }

  void selectButton(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  final List<String> _image = [
    'lib/assets/images/shirt2.jpg',
    'lib/assets/images/F5.jpg',
    'lib/assets/images/shirt7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                onPageChanged: (index , _ ) {
                  setState(() {
                    _currentSlide = index;
                  });
                }),
              items: _image.map((image){
                return Builder(
                    builder: (context){
                      return Image.asset(image, fit: BoxFit.cover,);
                    });
              }).toList(),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Shirts',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
                    Spacer(),
                    Text('Price: \$19.99',style: TextStyle(fontSize: 16,color: Colors.black),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text('Product Description',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• This is an amazing shirt',style: TextStyle(fontSize: 16,color: Colors.black),),
                Text('• This is an amazing shirt',style: TextStyle(fontSize: 16,),),
                Text('• This is an amazing shirt',style: TextStyle(fontSize: 16,),),
                Text('• This is an amazing shirt',style: TextStyle(fontSize: 16,),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                selectButton(2);
                addToCart();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text('ADD TO CART',style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
          ),
        ],
      ),
    );
  }
}
