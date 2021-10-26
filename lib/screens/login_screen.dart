import 'package:fire_chat/components/rounded_button.dart';
import 'package:fire_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email, password;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo_animation',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Your Email',
                  )),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  buttonText: 'Log In',
                  buttonColor: Colors.lightBlueAccent,
                  onClick: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    // log in user
                    try {
                      final loggedInUser =
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                      if (loggedInUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
