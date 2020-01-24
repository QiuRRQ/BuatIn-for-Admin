import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin/Screens/PrintOutPrice/PrintOutPriceScreen.dart';
import 'package:admin/Screens/SendToMail/SendToMailScreen.dart';

abstract class PrintOutPriceModel extends State<PrintOutPriceScreen>{

  String template;
  String layanan;
  String domain;
  String uid;
  String layananharga;
  String domainharga;
  double total;
  var documentID;
  bool isLoading = true;

  getList()async{
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      template = prefs.getString('Tema');
      print(template);
      layanan = prefs.getString('Paket');
      print(layanan);
      domain = prefs.getString('Domain');
      print(domain);
      layananharga = prefs.getString('PaketHarga');
      print(layananharga);
      domainharga = prefs.getString('DomainHarga');
      domainharga = domainharga.replaceAll(new RegExp(","), ".");
      print(domainharga);
      uid = prefs.getString("user");
      _totalSum();
      isLoading = false;
    });

  }

  _totalSum(){
    List temp = layananharga.split("Rp.");
    print("temp : $temp");
    List temp2 = temp[1].toString().split("/Bulan");
    temp2[0] = temp2[0].replaceAll(new RegExp(","), ".");
    print("temp 2 : ${temp2[0]}");//harga layanan
    total = double.parse(domainharga) + double.parse(temp2[0])+ double.parse("1000.000");
    print("total harga : $total");
  }

  setToDatabase()async{
      await Firestore.instance.runTransaction((Transaction transaction)async{
      CollectionReference reference = Firestore.instance.collection('pemesanan');
      final pesanRef = await reference.add({
        "uid":uid,
        "template":template,
        "layanan":layanan,
        "domain":domain,
        "harga":total, // total harga
        "status":"park"
      });
      setState(() {
        documentID = pesanRef.documentID;
      });
      print("this id : ${documentID.toString()}");
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => SendToMailScreen(documentID)));

  }

}