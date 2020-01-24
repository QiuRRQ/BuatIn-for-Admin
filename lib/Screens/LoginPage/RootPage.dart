import 'package:flutter/material.dart';
import 'package:admin/Models/LoginPageModel/authentication.dart';
import 'package:admin/Screens/Home/home.dart';
import 'package:admin/Screens/LoginPage/LoginPageScreen.dart';


class RootPage extends StatefulWidget {

  final BaseAuth auth;
  RootPage({this.auth});

  @override
  State<StatefulWidget>createState() =>RootPageState();
}

enum AuthStatus { notSignedIn, signedIn }

class RootPageState extends State<RootPage> {

  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((userId) {
      setState(() {
        _authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPageScreen(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return new home(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }

    return new LoginPageScreen(auth: widget.auth);

  }

}