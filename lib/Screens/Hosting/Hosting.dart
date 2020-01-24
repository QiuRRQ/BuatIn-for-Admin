import 'package:flutter/material.dart';
import 'package:admin/Screens/Hosting/Paket_1.dart';
import 'package:admin/Screens/Hosting/Paket_2.dart';
import 'package:admin/Screens/Hosting/Paket_3.dart';

class Hosting extends StatefulWidget{

  Host createState() => Host();

}

class Host extends State<Hosting>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paket Layanan"),
      ),
      body:
      Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
              Paket_1(),
              Paket_2(),
              Paket_3(),
          ],
        ),
      ),
    );
  }

}