import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/components/card_item.dart';
import 'package:flutter_e_commerce_app/pages/product_details.dart';

import '../components/bottom_nav_bar.dart';
import '../components/custom_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardItem> cardItems = [];

  String searchText = '';

  @override
  void initState() {
    super.initState();

    cardItems = [
      CardItem(title: '1 Shirt 1', pricing: '\$10', images: ['lib/assets/images/shirt1.jpeg','lib/assets/images/shirt8.jpg','lib/assets/images/shirt6.jpg']),
      CardItem(title: '2 Shirt 2', pricing: '\$20', images: ['lib/assets/images/shirt2.jpg','lib/assets/images/shirt4.jpg','lib/assets/images/shirt7.jpg']),
      CardItem(title: '3 Shirt 3', pricing: '\$20', images: ['lib/assets/images/shirt3.jpg','lib/assets/images/shirt6.jpg','lib/assets/images/shirt8.jpg']),
      CardItem(title: '4 Shirt 4', pricing: '\$40', images: ['lib/assets/images/shirt4.jpg','lib/assets/images/shirt2.jpg','lib/assets/images/shirt1.jpeg']),
      CardItem(title: '5 Shirt 5', pricing: '\$30', images: ['lib/assets/images/shirt5.jpg','lib/assets/images/shirt8.jpg','lib/assets/images/shirt4.jpg']),
      CardItem(title: '6 Shirt 6', pricing: '\$60', images: ['lib/assets/images/shirt6.jpg','lib/assets/images/shirt4.jpg','lib/assets/images/shirt1.jpeg']),
      CardItem(title: '7 Shirt 7', pricing: '\$40', images: ['lib/assets/images/shirt7.jpg','lib/assets/images/shirt2.jpg','lib/assets/images/shirt6.jpg']),
      CardItem(title: '8 Shirt 8', pricing: '\$20', images: ['lib/assets/images/shirt8.jpg','lib/assets/images/shirt1.jpeg','lib/assets/images/shirt4.jpg']),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: CustomScaffold(
          body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.green,),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                          Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search here...",
                                  border:InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    searchText = value;
                                  });
                                },
                              )
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.filter_list))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        child: GridView.count(
                          crossAxisCount: 2,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: cardItems
                              .where((cardItem) => cardItem.title
                              .toLowerCase()
                              .contains(searchText.toLowerCase()))
                              .map((cardItem){
                                return buildCard(cardItem);
                          }).toList()
                        ),
                      )
                  )
                ],
              ),
          ),
        showBottomNavBar: true,
        initialIndex: 0,
      ),
    );
  }

  Widget buildCard(CardItem cardItem) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetail(),));
        },
      child: Card(
        elevation: 20,
        margin: EdgeInsets.all(4),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: PageView.builder(
                itemCount: cardItem.images.length,
                onPageChanged: (int index) {
                  setState(() {
                    cardItem.currentIndex = index;
                  });
                },
                itemBuilder: (context,index) {
                  return Image.asset(
                    cardItem.images[index],
                    fit: BoxFit.cover,
                  );
                  },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(cardItem.images.length,
                      (int circleIndex) {
                return Padding(
                  padding: EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: circleIndex == cardItem.currentIndex ? Colors.blue : Colors.grey,
                  ),
                );
              })
            ),
            ListTile(
              title: Text(cardItem.title,style: TextStyle(color: Colors.black),),
              subtitle: Text(cardItem.pricing),

            ),
          ],
        ),
      ),
    );
  }
}

