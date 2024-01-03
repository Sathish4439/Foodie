import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodapp/pages/Hompage.dart';
import 'package:lottie/lottie.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.network(
          "https://lottie.host/80617ec8-df4c-49d5-8a9a-5ea22352cece/1eHOEHlxEj.json"),
    ));
  }
}
