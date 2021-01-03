//Lexical closures for validator function in TextFormFields (Email and Password)

Function(String) validateEmail = (String inputEmail) {
  //Regex Expression for RFC 5322 (Internet Message Format),
  // provided by http://emailregex.com/
  final RegExp expMail = RegExp(
      r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (inputEmail.isEmpty) {
    return 'Please enter your email.';
  } else if (!expMail.hasMatch(inputEmail)) {
    return 'Enter a valid email format.';
  } else {
    return null;
  }
};
// For validating password:
//r'^
//   (?=.*[A-Z])       // should contain at least one upper case English letter
//   (?=.*[a-z])       // should contain at least one lower case English letter
//   (?=.*?[0-9])      // should contain at least one digit
//  (?=.*?[!?@#\$&*~.\-_])  // should contain at least one Special character
//  from these ('!', '?', '@', '#', '$', '&', '*', '~', '.', '-', '_')
//   .{8,} Length password: minimum 8 characters
// $'
Function(String) validatePassword = (String inputPassword) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!?@#\$&*~.\-_]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (inputPassword.isEmpty) {
    return 'Please enter password.';
  } else if (inputPassword.length < 8) {
    return 'Password should contain at least 8 characters.';
    //Length >= 8 and does not match regex expression
  } else if (!regex.hasMatch(inputPassword)) {
    return 'Enter valid password. Password should contain at least'
        ' one upper case, one lower case, one digit'
        ' and one special character.';
  } else {
    return null;
  }
};
