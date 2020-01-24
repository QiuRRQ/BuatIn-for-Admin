import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:path/path.dart';
import 'package:admin/Models/DetailSiteFormModel/ImagePreviewModel.dart';

class ImagePreviewView extends ImagePreviewModel{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Preview"),
      ),
      body: _body(),
    );
  }

  _body(){
    return Container(
      child: isLoading ?
      Center(
        child: CircularProgressIndicator(),
      ) :
      ListView.builder(
          padding: EdgeInsets.only(
            top: 5.0,
          ),
          itemCount: nameImage.length,
          itemBuilder: (BuildContext context, int index) =>
              _image(index)),

//      ListView(
//
//        children: <Widget>[
//          _image()
//        ],
//      ),

    );
  }

  _image(int index){
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min, children: <Widget>[
        //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
        ListTile(

          title: Text('${widget.docID}_$index', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
          subtitle:
          Column(
            children: <Widget>[ //MENGGUNAKAN COLUMN
              Image(
                  image: NetworkImageWithRetry(nameImage[index],
                      scale: 0.85),  // NetworkImageWithRetry
                  fit: BoxFit.fill),  // Image
            ],
          ),
        ),
      ],
      ),
    );
  }

}