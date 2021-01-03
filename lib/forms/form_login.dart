import 'package:flutter/material.dart';
import 'package:splash_login/screens/home_screen.dart';
import 'package:splash_login/forms/form_validators.dart';

const kLabelLoginStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white);

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail;
  String _userPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.email),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'Email',
            ),
            validator: validateEmail,
            onSaved: (value) => _userEmail = value,
          ),
          SizedBox(
            height: 12.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.lock),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'Password',
              errorMaxLines: 3,
            ),
            validator: validatePassword,
            obscureText: true,
            onSaved: (value) => _userPassword = value,
          ),
          SizedBox(
            height: 36.0,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(Size(140, 40))),
            onPressed: () {
              //Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Processing login data')));
                print('User email: $_userEmail with password: $_userPassword');
                //Just for example to go to Home Screen
                if (_userEmail == 'test@gmail.com' &&
                    _userPassword == '1aQ!test') {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MyHomePage(title: 'Splash Login Home')),
                      (Route<dynamic> route) => false);
                }
              }
            },
            child: Text(
              'Login',
              style: kLabelLoginStyle,
            ),
          )
        ],
      ),
    );
  }
}
