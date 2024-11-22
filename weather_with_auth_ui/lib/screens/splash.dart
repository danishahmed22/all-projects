import 'package:flutter/material.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('lib/assets/images/cloud.png')),
          Text('Weather App', style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
