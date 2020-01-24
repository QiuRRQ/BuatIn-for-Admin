import 'package:flutter/material.dart';
import 'package:admin/Screens/SendToMail/SendToMailScreen.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SendToMailModel extends State<SendToMailScreen>{

  String body = "Nama Usaha: \n Alamat: \n Deskripsi: \n No Telepon: \n Informasi: tulis semua informasi terkait usaha anda sertakan foto atau gambar bila diperlukan \n\n";

  sendMail() async{
    print(widget.idPesanan.toString());
    //ToDO: buka gmail dan kirim email ke alamat email admin dengan subject apa gitu......
    var url = 'mailto:azizurrohim13@gmail.com?subject=PEMBAYARAN dan INFORMASI pesanan ${widget.idPesanan}&body=$body';
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }


}