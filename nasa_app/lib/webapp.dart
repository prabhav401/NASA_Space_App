import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WebApp extends StatelessWidget {
  var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web App'),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('home'));
                auth.signOut();
              })
        ],
      ),
      body: Center(
        child: Container(
          child: Text(
            'This is the main web page\n Welcome to Flutter World!!',
            style: TextStyle(color: Colors.red.shade900, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
