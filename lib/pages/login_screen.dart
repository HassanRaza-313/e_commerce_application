import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/pages/home_screen.dart';

import '../components/sign_button.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('lib/assets/images/bg.jpg',),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7),BlendMode.darken)
          ),
        ),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10),),
            const SizedBox(height: 50,),
            Image.asset('lib/assets/images/logo.png',height: 200,),
            Text('Shopping App',style: TextStyle(color: Colors.white,fontSize: 25),),
            const SizedBox(height: 8,),
            Text('One Solution',style: TextStyle(color: Colors.white,fontSize: 16),),
            const SizedBox(height: 180,),
            Button(
              text: 'Sign up',
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
              },
            ),
            SizedBox(height: 20,),
            Button(
              text: 'Sign in',
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
