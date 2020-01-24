import 'package:flutter/material.dart';
import 'package:admin/Models/History/Pemesanan.dart';
import 'package:admin/Screens/History/DetailHistoryView.dart';
import 'package:admin/Screens/History/HistoryView.dart';

class DetailHistoryScreen extends StatefulWidget{
  final Pemesanan order;

  DetailHistoryScreen(this.order);


  @override
  DetailHistoryView createState() => new DetailHistoryView();

}