import 'dart:collection';
import 'dart:convert';

import 'package:admin/Screens/History/DetailHistoryScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DetailHistoryModel extends State<DetailHistoryScreen>{

  bool isLoading = true;
  bool isEmpty = false;
  String sizeImage;
  String alamat;
  String deskripsi;
  String noTelepon;
  String namaUsaha;

  _getDetail()async{

    CollectionReference ref = Firestore.instance.collection('detailPesanan');
    QuerySnapshot querySnapshot = await ref.where("pesananID", isEqualTo: widget.order.documentId).getDocuments();

    if(querySnapshot.documents.isEmpty){
      setState(() {
        isEmpty = true;
        isLoading = false;
      });
    }else{
      setState(() {
        alamat = querySnapshot.documents[0]['alamat'];
        deskripsi = querySnapshot.documents[0]['deskripsi'];
        noTelepon = querySnapshot.documents[0]['noTelepon'];
        namaUsaha = querySnapshot.documents[0]['usaha'];
        sizeImage = querySnapshot.documents[0]['image'];
        isLoading = false;
        isEmpty = false;
      });
    }

  }

  @override
  void initState() {
    _getDetail();
    super.initState();
  }
}