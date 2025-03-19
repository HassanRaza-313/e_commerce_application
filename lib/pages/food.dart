import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/components/bottom_nav_bar.dart';
import 'package:flutter_e_commerce_app/pages/product_details.dart';
import '../components/custom_scaffold.dart';
import '../components/food_item.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List<FoodItem> foodItems = [];

  String searchText = '';

  @override
  void initState() {
    super.initState();

    foodItems = [
      FoodItem(images: ['lib/assets/images/F1.jpg','lib/assets/images/F3.jpg'],title: 'Food 1',subtitle: 'Description',rating: 4.5,price: 12),
      FoodItem(images: ['lib/assets/images/F2.jpg','lib/assets/images/F1.jpg'],title: 'Food 2',subtitle: 'Description',rating: 4.5,price: 15),
      FoodItem(images: ['lib/assets/images/F6.jpg','lib/assets/images/F5.jpg'],title: 'Food 3',subtitle: 'Description',rating: 4.8,price: 13),
      FoodItem(images: ['lib/assets/images/F4.jpg','lib/assets/images/F6.jpg'],title: 'Food 4',subtitle: 'Description',rating: 4.3,price: 15),
      FoodItem(images: ['lib/assets/images/F5.jpg','lib/assets/images/F2.jpg'],title: 'Food 5',subtitle: 'Description',rating: 4.9,price: 22),
      FoodItem(images: ['lib/assets/images/F3.jpg','lib/assets/images/F5.jpg'],title: 'Food 6',subtitle: 'Description',rating: 4.4,price: 8),
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
                                hintText: "Search",
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
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.filter_list)
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child:
                      // GridView.builder(
                      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                      //     itemBuilder: ( (context,index) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //
                      //         ),
                      //       );
                      //
                      //     }),
                      // )
                      GridView.count(
                          crossAxisCount: 1,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: foodItems
                              .where((foodItem) => foodItem.title
                              .toLowerCase()
                              .contains(searchText.toLowerCase()))
                              .map((foodItem){
                            return buildCard(foodItem);
                          }).toList()
                      ),
                    )
                )
              ],
            )
        ),

        showBottomNavBar: true,
        initialIndex: 1,

      ),
    );
  }

  Widget buildCard(FoodItem foodItem) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetail(),));
      },
      child: Card(
        elevation: 20,
        margin: EdgeInsets.all(6),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: foodItem.images.length,
                onPageChanged: (int index) {
                  setState(() {
                    foodItem.currentIndex = index;
                  });
                },
                itemBuilder: (context,index) {
                  return Image.asset(
                    foodItem.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(foodItem.images.length,
                        (int circleIndex) {
                      return Padding(
                        padding: EdgeInsets.all(3),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: circleIndex == foodItem.currentIndex ? Colors.blue : Colors.grey,
                        ),
                      );
                    })
            ),
            ListTile(
              title: Text(foodItem.title,style: TextStyle(color: Colors.black),),
              subtitle: Text(foodItem.subtitle,),
            ),
          ],
        ),
      ),
    );
  }
}
