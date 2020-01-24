import 'dart:io';

import 'package:flutter/material.dart';
import 'package:admin/Screens/DetailSiteForm/ImagePreviewView.dart';

class ImagePreviewScreen extends StatefulWidget{

  final List<File> pictureList;

  final String docID;

  final int size;

  ImagePreviewScreen({this.pictureList, this.docID, this.size});

  ImagePreviewView createState() => ImagePreviewView();

}
