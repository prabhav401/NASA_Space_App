import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginSnack(),
    );
  }
}

var email, pass, emailid;
var emailcontrol = TextEditingController();
var passcontrol = TextEditingController();
bool passvalidate = false;
bool emailvalidate = false;

class LoginSnack extends StatefulWidget {
  @override
  _LoginSnackState createState() => _LoginSnackState();
}

class _LoginSnackState extends State<LoginSnack> {
  var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/nasa.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 370,
            ),
            TextFormField(
              controller: emailcontrol,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              decoration: new InputDecoration(
                  labelText: "Enter Email",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 4,
                      ))),
              validator: (val) {
                if (val.length == 0) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passcontrol,
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              decoration: new InputDecoration(
                  labelText: "Enter Password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 4,
                      ))),
              validator: (val) {
                if (val.length == 0) {
                  return "Password cannot be empty";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                pass = value;
              },
            ),
            RaisedButton(
              onPressed: () async {
                setState(() {
                  emailcontrol.text.isEmpty
                      ? emailvalidate = true
                      : emailvalidate = false;
                  passcontrol.text.isEmpty
                      ? passvalidate = true
                      : passvalidate = false;
                });
                if (emailcontrol.text.isEmpty == false &&
                    passcontrol.text.isEmpty == false) {
                  emailcontrol.clear();
                  passcontrol.clear();

                  try {
                    var login = await auth.signInWithEmailAndPassword(
                        email: email, password: pass);
                    var firebaseUser = FirebaseAuth.instance.currentUser;
                    emailid = firebaseUser.email;

                    Navigator.pushNamed(context, "details");
                  } catch (e) {
                    String x = e.code;
                    Scaffold.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(
                          x,
                          style: TextStyle(color: Colors.black),
                        )));
                  }
                }
              },
              color: Colors.blue,
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
