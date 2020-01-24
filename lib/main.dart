import 'package:flutter/material.dart';
import 'package:admin/Models/LoginPageModel/authentication.dart';
import 'package:admin/Screens/History/History.dart';
import 'package:admin/Screens/Profile/Profile.dart';
import 'package:admin/Screens/Home/home.dart';
import 'Screens/LoginPage/RootPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: RootPage(auth: new Auth()),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => new home(),
        "/b": (BuildContext context) => new History("Riwayat Pemesanan"),
        "/c": (BuildContext context) => new Profile("Profile"),
      }
    );
  }
}
