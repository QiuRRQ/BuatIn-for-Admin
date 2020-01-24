
import 'package:flutter/material.dart';
import 'package:admin/Models/History/DetailHistoryModel.dart';
import 'package:admin/Screens/DetailSiteForm/ImagePreviewScreen.dart';

class DetailHistoryView extends DetailHistoryModel{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pesanan"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        height: 500,
        child: isLoading ?
        Center(
          child: CircularProgressIndicator(),
        ) : isEmpty ?
            Center(
              child: Text("Detail Informasi Usaha dan bukti transfer belum di isi"),
            ) :
        new Card(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Domain : "),
                  new Text(widget.order.domain)
                ],
              ),
              Text("\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Total Biaya : "),
                  new Text(widget.order.harga)
                ],
              ),
              Text("\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Paket Layanan : "),
                  new Text(widget.order.layanan)
                ],
              ),
              Text("\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Status Pengerjaan : "),
                  new Text(widget.order.status)
                ],
              ),
              Text("\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Template : "),
                  new Text(widget.order.template)
                ],
              ),
//              Text("\n"),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: <Widget>[
//                  new Text("Alamat Usaha : "),
//                  new Text(alamat)
//                ],
//              ),
//              Text("\n"),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: <Widget>[
//                  new Text("Nama usaha : "),
//                  new Text(namaUsaha)
//                ],
//              ),
//              Text("\n"),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: <Widget>[
//                  new Text("Deskripsi Usaha: "),
//                  new Text(deskripsi)
//                ],
//              ),
//              Text("\n"),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: <Widget>[
//                  new Text("No Telepon : "),
//                  new Text(noTelepon)
//                ],
//              ),

//              Row(
//                children: <Widget>[
//                  Text("Preview image"),
//                  FlatButton(onPressed: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreviewScreen(size: int.parse(sizeImage), docID : widget.order.documentId)));
//                  }, child: Text("Click Here", style: TextStyle(fontFamily: "Title", color: Colors.red, fontSize: 12)))
//                ],
//              ),

            ],
          ),
        ),

      ),
    );
  }

}