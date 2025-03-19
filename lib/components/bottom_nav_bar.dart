import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/pages/home_screen.dart';
import '../pages/food.dart';
import '../pages/my_account.dart';
import '../pages/my_cart.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex = 0;

  @override
  void initState(){
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0: _navigateToRoute(context,'/home',HomeScreen());
      break;
      case 1: _navigateToRoute(context,'/food',Food());
      break;
      case 2: _navigateToRoute(context,'/My Cart',MyCart());
      break;
      case 3: _navigateToRoute(context,'/My Account',MyAccount());
      break;
    }
  }

  void _navigateToRoute(context,String routeName,Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routeName;

    if(routeExists) {
      Navigator.popUntil(context, ModalRoute.withName(routeName));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:(context) => screen,
            settings: RouteSettings(
                name: routeName
            ),
          ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.green,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,color: _selectedIndex == 0 ? Colors.white : Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined,color: _selectedIndex == 1 ? Colors.white : Colors.black),
            label: 'Foods',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined,color: _selectedIndex == 2 ? Colors.white : Colors.black),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined,color: _selectedIndex == 3 ? Colors.white : Colors.black),
            label: 'Account',
          ),
        ]
    );
  }
}
