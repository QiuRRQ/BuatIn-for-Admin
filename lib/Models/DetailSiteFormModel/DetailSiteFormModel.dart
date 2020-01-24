import 'dart:io';
import 'package:admin/Screens/DetailSiteForm/DetailSiteFormScreen.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart' as path;

abstract class DetailSiteFormModel extends State<DetailSiteFormScreen>{

  var namaUsaha = TextEditingController();
  var Deskripsi = TextEditingController();
  var Alamat = TextEditingController();
  var NomorTelepon = TextEditingController();

  File galeryFile;
  File cameraFile;
  String informationUser ="";
  int counter=0;

  List<File> pictureList = List();

  validateAndSubmit() async {

    informationUser = informationUser + namaUsaha.text.toString() +
        Deskripsi.text.toString() + Alamat.text.toString()+NomorTelepon.text.toString();
    print(informationUser);

    CollectionReference ref = Firestore.instance.collection('detailPesanan');

    final pesanRef = await ref.add({
      "pesananID":widget.documentID,
      "usaha":namaUsaha.text.toString(),
      "deskripsi":Deskripsi.text.toString(),
      "alamat":Alamat.text.toString(),
      "image": pictureList.length.toString(),
      "noTelepon":NomorTelepon.text.toString()
    });

//    CollectionReference updatePemesanan = Firestore.instance.collection('pemesanan');
//
//    updatePemesanan.document(widget.documentID).updateData(
//      {
//        "status" : "Process"
//      }
//    ).catchError((e) {
//      print(e);
//    });



  }

  imageSelectorGallery()async{
    var _galery =  await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      galeryFile = _galery;
      pictureList.add(galeryFile);
    });

    counter++;
    print('picName : ${widget.documentID.toString()}');
    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('${widget.documentID.toString()}_$counter');
    final StorageUploadTask task = firebaseStorageRef.putFile(_galery);

    print("You selected gallery image : " + galeryFile.path);
    print(galeryFile);
    print(pictureList.length.toString());
  }

  imageSelectorCamera()async{
    var _camera = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      cameraFile = _camera;
      pictureList.add(cameraFile);
    });

    counter++;
    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('${widget.documentID}_$counter');
    final StorageUploadTask task = firebaseStorageRef.putFile(_camera);

    print("You selected camera image : " + cameraFile.path);
    print(cameraFile);
    print(pictureList.length.toString());

  }

}