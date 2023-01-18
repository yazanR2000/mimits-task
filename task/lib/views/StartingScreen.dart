import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task/views/Home.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/young-handsome-physician-medical-robe-with-stethoscope.jpg",
            ),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textAlign:TextAlign.center ,
                  "Mimits Life Health Care",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Care And Cure Is Our Goals",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Home.routeName);
                  },
                  child: Text("Get Started",),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
