import 'package:flutter/material.dart';
import 'package:foodapp/pages/Hompage.dart';
import 'package:foodapp/pages/cartpage.dart';
import 'package:foodapp/pages/intropage.dart';
import 'package:foodapp/provider/cartprovider.dart';
import 'package:provider/provider.dart';
 
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CartProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Intropage());
  }
}
