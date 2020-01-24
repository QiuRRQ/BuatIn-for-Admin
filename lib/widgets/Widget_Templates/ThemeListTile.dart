import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:admin/Models/theme/Theme.dart' as a;
import 'package:flutter_image/network.dart';
import 'package:admin/Models/theme/ThemesListTile_model/ThemesListTile_model.dart';
import 'package:admin/Screens/Hosting/Hosting.dart';

const String IMAGE_BASE_URL = "http://image.tmdb.org/t/p/w185";

class ThemesListTile extends StatelessWidget {

  final a.Theme tema;
  ThemesListTile({this.tema});



  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Column(
        mainAxisSize: MainAxisSize.min, children: <Widget>[
        //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
        ListTile(

          title: Text(tema.name, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
          subtitle:
          Column(
            children: <Widget>[ //MENGGUNAKAN COLUMN
              //DIMANA MASING-MASING COLUMN TERDAPAT ROW
              Row(
                children: <Widget>[
                  //MENAMPILKAN TEXT arti
                  Text('Versi : ', style: TextStyle(fontWeight: FontWeight.bold),),
                  //MENAMPILKAN TEXT DARI VALUE arti
                  Text(tema.version, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                ],
              ),
              Image(
                  image: NetworkImageWithRetry('http:'+tema.screenshot_url,
                      scale: 0.85),  // NetworkImageWithRetry
                  fit: BoxFit.fill),  // Image
            ],
          ),
        ),
        //TERAKHIR, MEMBUAT BUTTON
        ButtonTheme.bar(
          child: ButtonBar(
            children: <Widget>[
              // BUTTON PERTAMA
              new RaisedButton(
                //DENGAN TEXT LIHAT DETAI
                  child: const Text('PILIH INI',),
                  textColor: Colors.white,
                  onPressed: (){
                    saveData();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Hosting()));
                  }
              )
            ],
          ),
        ),
      ],
      ),
    );
         // Card
  }

  saveData(){
    setData(tema.name);
  }

}

