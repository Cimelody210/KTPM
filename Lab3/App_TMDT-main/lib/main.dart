import 'package:doan_tmdt/firebase_options.dart';
import 'package:doan_tmdt/model/bottom_appar.dart';
import 'package:doan_tmdt/screen/cart/cart_page.dart';
import 'package:doan_tmdt/screen/home/product_detail_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doan_tmdt/screen/login/login_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     home: LoginScreen()
    // home: MyBottomNavigator(),
    
    );
  }
}
