import 'package:flutter/material.dart';
import 'package:admin/Models/LoginPageModel/authentication.dart';
import 'package:admin/Models/SendToMailModel/SendToMailModel.dart';
import 'package:admin/Screens/LoginPage/RootPage.dart';

class SendToMailView extends SendToMailModel{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rincian Harga"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        height: 450,
        child:
        new Card(
          child: Column(
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Kirimkan Informasi Terkait usaha anda dan produk yang anda pasarkan ke email admin "),
                  new Text("Serta kirimkan bukti tranfer pembayaran anda agar website anda bisa segera dibuatkan"),
                  new Text("untuk perbahan serta perawatan konten website anda bisa anda komunikasikan ke admin melalui"),
                  new Text("alamat email yang sama")
                ],
              ),
              Text("\n"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("jika bukti pembayaran sudah diverifikasi admin status website anda akan berubah menjadi process"),
                  new Text("jika bukti pembayaran dianggap salah maka status akan tetap park, dan harap kirim ulang bukti pembayaran"),
                ],
              ),
              ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // BUTTON PERTAMA
                    new RaisedButton(
                      //DENGAN TEXT LIHAT DETAI
                        child: const Text('Kirim Email',),
                        textColor: Colors.white,
                        onPressed: () {
                          sendMail();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RootPage(auth: new Auth())));
                        }
                    ),
                    new RaisedButton(
                      //DENGAN TEXT LIHAT DETAI
                        child: const Text('Pemesanan Selesai',),
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RootPage(auth: new Auth())));
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


}