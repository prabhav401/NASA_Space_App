import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

var fs, d, auth, sleep, calorie;

class Advice extends StatefulWidget {
  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<Advice> {
  get() async {
    print(emailid);
    auth = FirebaseAuth.instance;
    //var firebaseUser = FirebaseAuth.instance.currentUser;
    //print(firebaseUser.uid);
    fs.collection("astronauts").document(emailid).get().then((value) {
      var info = value.data();
      setState(() {
        sleep = info['sleep'];
        calorie = info['calories'];
      });

      //  print(sleep);
      //  print(calorie);
    });
  }

  @override
  Widget build(BuildContext context) {
    fs = FirebaseFirestore.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hi Astronaut !'),
          actions: [
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('login'));
                  auth.signOut();
                })
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Center(
                child: RaisedButton(
                  onPressed: get,
                  child: Text(
                    'Get you data',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  emailid,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/sleep.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    //color: Colors.red,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/calorie.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sleep ?? 'Sleep',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Text(
                    calorie ?? 'Calorie',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, "advice"),
                  child: Text(
                    'Get advice...',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
