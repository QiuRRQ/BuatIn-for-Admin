import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:admin/Screens/DetailSiteForm/ImagePreviewScreen.dart';

abstract class ImagePreviewModel extends State<ImagePreviewScreen>{


  bool isLoading = true;
  String image;
  int count;

  var urlimage;
  int iterator = 1;

  List<String> nameImage = [];

  _check() async{
    if(widget.pictureList == null){
      count = widget.size;
    }else{
      count = widget.pictureList.length;
    }


    for(int i = 1; i <= count; i++){
      final ref = FirebaseStorage.instance.ref().child('${widget.docID}_$i');
      urlimage = await ref.getDownloadURL();
      nameImage.add(urlimage.toString());
    }

    print(nameImage[0]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _check();
    
    super.initState();
  }
}