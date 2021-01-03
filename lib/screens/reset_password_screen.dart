import 'package:flutter/material.dart';
import 'package:splash_login/forms/form_reset_password.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset password'),
        ),
        body: Container(
            margin: EdgeInsets.all(16.0),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: FormResetPassword()));
  }
}
