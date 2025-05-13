import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginscreen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/my_screen/splash_screen.dart';
import 'firebase_options.dart';

// ...


void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}
