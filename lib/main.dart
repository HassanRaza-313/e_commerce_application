import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/components/cart_provider.dart';
import 'package:flutter_e_commerce_app/pages/home_screen.dart';
import 'package:flutter_e_commerce_app/pages/login_screen.dart';
import 'package:flutter_e_commerce_app/pages/sign_in_screen.dart';
import 'package:flutter_e_commerce_app/pages/splash_screen.dart';
import 'package:flutter_e_commerce_app/pages/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDXUcQe-lGaw8D21VZj18Kuot5k6PJZ09Q",
        projectId: "e-commerce-1-971f2",
        messagingSenderId: "192257942424",
        appId: "1:192257942424:web:a63f705f430648afd301ed"
    )
  );
  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}