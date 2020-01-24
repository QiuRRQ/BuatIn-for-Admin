import 'package:flutter/material.dart';
import 'package:admin/Screens/RegisterPage/RegisterPageScreen.dart';

enum AuthStatus { notSignedIn, signedIn }
abstract class RegisterPageModel extends State<RegisterPageScreen>{
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  bool isShow = false;


  AuthStatus _authStatus = AuthStatus.notSignedIn;

  setShow() {
    setState(() {
      isShow = isShow ? false : true;
    });
  }

  signedIn() {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void validateAndSubmit() async {
    try {
      String userId =await widget.auth.signUp(email.text.toString(), password.text.toString(), name.text.toString(), "client");
      print("Registered user: $userId");
      if (userId.isNotEmpty){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Succes"),
              content: new Text("Registration Success"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      }
    } catch (e) {
      print("error: $e");
    }
  }


}