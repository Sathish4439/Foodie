import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodapp/const.dart';
import 'package:foodapp/pages/Hompage.dart';
import 'package:lottie/lottie.dart';

class Finalpage extends StatefulWidget {
  const Finalpage({super.key});

  @override
  State<Finalpage> createState() => _FinalpageState();
}

class _FinalpageState extends State<Finalpage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primarycolor,
        body: Center(
      child: Lottie.network(
          "https://lottie.host/3cb405e4-080e-4185-a078-b20f5bb893ed/tqHIRQCHfV.json"),
    ));
  }
}
