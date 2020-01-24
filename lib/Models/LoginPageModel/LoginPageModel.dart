import 'package:flutter/material.dart';
import 'package:admin/Screens/LoginPage/LoginPageScreen.dart';
import 'package:admin/Screens/LoginPage/RootPage.dart';
import 'package:google_sign_in/google_sign_in.dart';


abstract class LoginPageModel extends State<LoginPageScreen>{
  var email = TextEditingController();
  var password = TextEditingController();
  bool isShow = false;

  final GoogleSignIn googleSignIn = new GoogleSignIn();

  setShow() {
    setState(() {
      isShow = isShow ? false : true;
    });
  }

  void validateAndSubmit() async {
    try {
      String userId = await widget.auth.signIn(email.text.toString(), password.text.toString());
      print("signed in: $userId");
      widget.onSignedIn();
      Navigator.push(context, MaterialPageRoute(builder: (context) => RootPage( auth: widget.auth)));
    } catch (e) {
      print("error: $e");
    }
  }

  void googleLogin()async{
    try{
      await widget.auth.googleSignIn();
      widget.onSignedIn();
      Navigator.push(context, MaterialPageRoute(builder: (context) => RootPage( auth: widget.auth)));
    }catch(e){
      print("error: $e");
    }
  }

}