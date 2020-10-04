import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:nasa_app/webapp.dart';
import 'advice.dart';
import 'details.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        "login": (context) => Login(),
        //"webapp": (context) => WebApp(),
        "details": (context) => Details(),
        "advice": (context) => Advice(),
      },
    ),
  );
}
