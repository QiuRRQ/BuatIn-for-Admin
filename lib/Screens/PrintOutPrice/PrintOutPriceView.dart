import 'package:flutter/material.dart';
import 'package:admin/Models/LoginPageModel/authentication.dart';
import 'package:admin/Models/PrintOutPriceModel/PrintOutPriceModel.dart';
import 'package:admin/Screens/DetailSiteForm/DetailSiteFormScreen.dart';
import 'package:admin/Screens/LoginPage/RootPage.dart';
import 'package:admin/Screens/SendToMail/SendToMailScreen.dart';

class PrintOutPriceView extends PrintOutPriceModel{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rincian Harga"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        height: 450,
        child: isLoading ?
        Center(
          child: CircularProgressIndicator(),
        ) :
        new Card(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Template: "+template),
                  new Text("Free")
                ],
              ),
              Text("\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Domain: "+domain),
                  new Text(domainharga)
                ],
              ),
              Text("\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Paket Layanan: "+layanan),
                  new Text(layananharga)
                ],
              ),
              Text("\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Jasa Pembuatan"),
                  new Text("Rp. 1000.000")
                ],
              ),
              Text("\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Total Harga: "),
                  new Text(total.toString())
                ],
              ),
              Text("\n\nKlik Lanjut untuk mengisi informasi terkait website anda\n\n"),
              ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // BUTTON PERTAMA
                    new RaisedButton(
                      //DENGAN TEXT LIHAT DETAI
                        child: const Text('Lanjut',),
                        textColor: Colors.white,
                        onPressed: () {
                          setToDatabase();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailSiteFormScreen(this.documentID)));
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getList();
  }

}