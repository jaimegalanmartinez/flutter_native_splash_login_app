import 'package:flutter/material.dart';
import 'package:splash_login/forms/form_validators.dart';

const kLabelSendStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white);

class FormResetPassword extends StatefulWidget {
  @override
  _FormResetPasswordState createState() => _FormResetPasswordState();
}

class _FormResetPasswordState extends State<FormResetPassword> {
  final _formResetPasswordKey = GlobalKey<FormState>();
  String _emailToSendReset;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formResetPasswordKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 20.0,
        ),
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
            hintText: 'Type email to send password reset',
          ),
          validator: validateEmail,
          onSaved: (value) => _emailToSendReset = value,
        ),
        const SizedBox(
          height: 60.0,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(Size(160, 64))),
            onPressed: () {
              //Validate returns true if the form is valid, or false otherwise.
              if (_formResetPasswordKey.currentState.validate()) {
                _formResetPasswordKey.currentState.save();

                //This is shown as an example
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Sending password reset')));
                print('Email to send password reset: $_emailToSendReset');
                //You can implement code here for sending the real reset
              }
            },
            child: const Text(
              'Send password\n reset',
              textAlign: TextAlign.center,
              style: kLabelSendStyle,
            )),
      ]),
    );
  }
}
