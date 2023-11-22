import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 199, 199),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            child: const Center(
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/notes.png')),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            'Notes App',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          )),
        ],
      ),
    );
  }
}
