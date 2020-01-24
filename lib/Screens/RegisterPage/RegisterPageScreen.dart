import 'package:flutter/material.dart';
import 'package:admin/Models/LoginPageModel/authentication.dart';

import 'package:admin/Screens/RegisterPage/RegisterPageView.dart';

class RegisterPageScreen extends StatefulWidget{


  final BaseAuth auth;
  RegisterPageScreen(this.auth);

  @override
  RegisterPageView createState() => new RegisterPageView();

}