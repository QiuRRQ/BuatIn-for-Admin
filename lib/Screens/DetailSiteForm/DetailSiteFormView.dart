import 'dart:io';

import 'package:flutter/material.dart';
import 'package:admin/Models/DetailSiteFormModel/DetailSiteFormModel.dart';
import 'package:admin/Models/LoginPageModel/authentication.dart';
import 'package:admin/Screens/DetailSiteForm/ImagePreviewScreen.dart';
import 'package:admin/Screens/LoginPage/RootPage.dart';

class DetailSiteFormView extends DetailSiteFormModel{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Informasi Usaha"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Container(
        child: Center(
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              height: 1000,
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: namaUsaha,
                        decoration: InputDecoration(
                            labelText: "Nama Usaha", prefixIcon: Icon(Icons.person)),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        controller: Deskripsi,
                        decoration: InputDecoration(
                            labelText: "Deskripsi Usaha", prefixIcon: Icon(Icons.text_fields)),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        controller: Alamat,
                        decoration: InputDecoration(
                            labelText: "Alamat Usaha", prefixIcon: Icon(Icons.home)),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        controller: NomorTelepon,
                        decoration: InputDecoration(
                            labelText: "Nomor Telepon Usaha", prefixIcon: Icon(Icons.phone)),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      //foto produk usaha
                      Column(
                        children: <Widget>[
                          Text("Foto Produk"),
                          FlatButton(onPressed: () {_imagePicker(context);}, color: Colors.black12,child: Text("Add Picture", style: TextStyle(fontFamily: "Title", color: Colors.black, fontSize: 12)))
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      //foto bukti pembayaran
                      Column(
                        children: <Widget>[
                          Text("Foto Bukti Pembayaran"),
                          FlatButton(onPressed: () {_imagePicker(context);}, color: Colors.black12,child: Text("Add Picture", style: TextStyle(fontFamily: "Title", color: Colors.black, fontSize: 12)))
                        ],
                      ),
                      //
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      pictureList.isEmpty ? Text("No Image to Display !")
                          : Row(
                              children: <Widget>[
                                Text("Preview your image"),
                                FlatButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreviewScreen(pictureList : pictureList, docID : widget.documentID)));
                                  }, child: Text("Click Here", style: TextStyle(fontFamily: "Title", color: Colors.red, fontSize: 12)))
                              ],
                            ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: new RaisedButton(
                          onPressed: (){
                            validateAndSubmit();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RootPage(auth: new Auth())));
                          },
                          color: Colors.blue,
                          child: Text("Lanjut", style: TextStyle(fontFamily: "Title", color: Colors.white, fontSize: 17),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _imagePicker(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context){
          return SizedBox(
            height: 100,
            child: Scaffold(
              body: Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new FlatButton(onPressed: imageSelectorCamera, child: Column(
                      children: <Widget>[
                        Icon(Icons.camera_alt),
                        Text("Camera", style: TextStyle(fontFamily: "Title", color: Colors.black, fontSize: 12))
                      ],
                    )),
                    new FlatButton(onPressed: imageSelectorGallery, child: Column(
                      children: <Widget>[
                        Icon(Icons.image),
                        Text("Galery", style: TextStyle(fontFamily: "Title", color: Colors.black, fontSize: 12))
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }

}