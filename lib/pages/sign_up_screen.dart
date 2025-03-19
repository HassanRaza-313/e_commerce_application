import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/pages/home_screen.dart';
import 'package:flutter_e_commerce_app/pages/login_screen.dart';

import 'sign_in_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      alignment: Alignment.topRight,
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Image.asset('lib/assets/images/logo.png',height: 170,),
                Text('Create an account',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                SizedBox(height: 10,),
                Text('Please register yourself to continue ',style: TextStyle(fontSize: 16,color: Colors.white,),),
                SizedBox(height: 40,),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white,),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.email,color: Colors.white,),
                      labelStyle: TextStyle(fontSize: 12,color: Colors.white)
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white,),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock,color: Colors.white,),
                    labelStyle: TextStyle(fontSize: 12,color: Colors.white),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white,),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    labelText: ' Confirm password',
                    prefixIcon: Icon(Icons.lock,color: Colors.white,),
                    labelStyle: TextStyle(fontSize: 12,color: Colors.white),
                  ),
                ),
                SizedBox(height: 25,),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                          .then((value) => {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()))
                      },);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 16),),
                        SizedBox(width:10,),
                        Icon(Icons.arrow_forward,size: 24,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I have an account?", style: TextStyle(color: Colors.white, fontSize: 15,),),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignIn()));
                      },
                      child: Text('Sign in',style: TextStyle(color: Colors.green),),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
