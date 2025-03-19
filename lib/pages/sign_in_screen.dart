import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/pages/sign_up_screen.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
                        },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Image.asset('lib/assets/images/logo.png',height: 170,),
                Text('Sign In',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                SizedBox(height: 10,),
                Text('Please sign in to continue ',style: TextStyle(fontSize: 16,color: Colors.white,),),
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
                      suffixIcon: TextButton(
                        onPressed: () {},
                        child: Text('Forget?',style: TextStyle(fontSize: 12,color: Colors.white),),
                      ),
                      labelStyle: TextStyle(fontSize: 12,color: Colors.white),
                  ),
                ),
                SizedBox(height: 25,),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text).then((value) => {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen())),
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor : Colors.white,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sign In',style: TextStyle(color: Colors.black,fontSize: 16),),
                        SizedBox(width:10,),
                        Icon(Icons.arrow_forward,size: 24,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height:10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.white, fontSize: 15,),),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      child: Text('Create account',style: TextStyle(color: Colors.green),),),
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

