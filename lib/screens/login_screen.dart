import 'package:flutter/material.dart';
import 'package:splash_login/forms/form_login.dart';
import 'package:splash_login/screens/reset_password_screen.dart';

//Constants for determining text style of some login labels.
const kLabelSignInStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.blue);

const kLabelForgotPassword =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blue);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Container by default with white colour background, you can change the color or use a gradient.
      body: Container(
        margin: EdgeInsets.all(16.0),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //For example your App's Name
            const Text(
              'Splash Login App',
              style: kLabelSignInStyle,
            ),
            LoginForm(),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ResetPasswordScreen()));
                },
                child: const Text(
                  'Forgot password?',
                  style: kLabelForgotPassword,
                ))
          ],
        ),
      ),
    );
  }
}
