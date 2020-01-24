import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin/Models/History/Pemesanan.dart';
import 'package:admin/Screens/History/History.dart';

abstract class HistoryModel extends State<History>{
  bool isLoading = true;
  bool admin = false;
  List<Pemesanan> listOrder = new List<Pemesanan>();

  List status = ["Select Option","park", "Process", "Deliver", "Complete"];
  List<DropdownMenuItem<String>> dropDownMenuItems;
  String currentStatus;

  _getPemesanan()async{
    var prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('user');
    String role = prefs.getString('role');
    QuerySnapshot querySnapshot;

    CollectionReference ref = Firestore.instance.collection('pemesanan');
    if(role == "admin") {
      querySnapshot = await ref.getDocuments();
    }else{
      querySnapshot = await ref.where("uid", isEqualTo: uid).getDocuments();
    }


    HashMap<String, Pemesanan> eventsHashMap = new HashMap<String, Pemesanan>();

    querySnapshot.documents.forEach((document){
      eventsHashMap.putIfAbsent(document.documentID, () => new Pemesanan(
        domain: document['domain'],
        documentId: document.documentID,
        harga: document['harga'].toString(),
        layanan: document['layanan'],
        status: document['status'],
        template: document['template'],
        uid: document['uid']
      ));
    });

    setState(() {
      if(role == "admin"){
        admin = true;
      }
      listOrder =  eventsHashMap.values.toList();
      print("order length : ${listOrder.length.toString()}");
      isLoading = false;
    });

  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String i in status) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(
          value: i,
          child: new Text(i)
      ));
    }
    return items;
  }

//  changeStatus(String status, String docID)async{
//    CollectionReference updatePemesanan = Firestore.instance.collection('pemesanan');
//
//    updatePemesanan.document(docID).updateData(
//        {
//          "status" : status
//        }
//    ).catchError((e) {
//      print(e);
//    });
//
//    setState(() {
//      this.status = status;
//    });
//
//  }

  changedDropDownItem(String selectedStatus, String docID) {

    if(selectedStatus != "Select Option"){
      CollectionReference updatePemesanan = Firestore.instance.collection('pemesanan');

      updatePemesanan.document(docID).updateData(
          {
            "status" : selectedStatus
          }
      ).catchError((e) {
        print(e);
      });
    }

    print("Selected $selectedStatus, refresh the UI");

    setState(() {
      _getPemesanan();
    });

  }


  @override
  void initState() {
    _getPemesanan();
    dropDownMenuItems = getDropDownMenuItems();
    currentStatus = dropDownMenuItems[0].value;
    super.initState();
  }
}