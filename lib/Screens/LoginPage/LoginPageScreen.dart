import 'package:flutter/material.dart';
import 'package:admin/Models/LoginPageModel/authentication.dart';
import 'package:admin/Screens/LoginPage/LoginPageView.dart';

class LoginPageScreen extends StatefulWidget{

  LoginPageScreen({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  LoginPageView createState() => new LoginPageView();

}