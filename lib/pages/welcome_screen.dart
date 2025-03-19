import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/pages/login_screen.dart';

import '../components/welcome_slider.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final _pageController = PageController();
  int _currentPage = 0;

  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(title: 'Shop All you want!', description: 'Select a wide range of variety', image: 'lib/assets/images/1.png'),
    WelcomeSlider(title: 'Save time, Order Online', description: 'Convenience at your fingertips', image: 'lib/assets/images/2.png'),
    WelcomeSlider(title: 'The greatest shop journey', description: 'Make a practical choice with one voice', image: 'lib/assets/images/3.png'),
    WelcomeSlider(title: 'All in One!', description: 'What do you want to buy!', image: 'lib/assets/images/4.png'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: (){
                        // Navigate to Home Screen
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text('Skip',style: TextStyle(color: Colors.red,fontSize: 16),),),
                ),
                const SizedBox(height: 25,),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: welcomeSlider.length,
                    onPageChanged: (value){
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemBuilder: (context,index){
                      final item = welcomeSlider[index];
                      return Column(
                      children: [
                        Image.asset(item.image,height: 350,),
                        const SizedBox(height: 10,),
                        Text(item.title,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,),
                        ),
                        const SizedBox(height: 5,),
                        Text(item.description,
                          style: TextStyle(
                            color: Color.fromARGB(255, 94, 92, 92),
                            fontSize: 20
                          ),
                        )
                      ],
                    );
                  },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 10,
                          width: _currentPage == index ? 30 : 10,
                          decoration: BoxDecoration(
                              color: _currentPage == index ? Colors.red : Colors.grey,
                              borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                      );
                      },
                    ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){
            if(_currentPage < welcomeSlider.length - 1){
              _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
            } else {
              // Navigate to Home Screen
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
          },
          child: _currentPage != welcomeSlider.length -1 ? const Icon(Icons.arrow_forward) : const Icon(Icons.done),
        ),
    );
  }
}
