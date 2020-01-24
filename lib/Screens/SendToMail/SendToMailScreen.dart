import 'package:flutter/material.dart';
import 'package:admin/Screens/SendToMail/SendToMailView.dart';

class SendToMailScreen extends StatefulWidget{

  var idPesanan;

  SendToMailScreen(this.idPesanan);

  SendToMailView createState() => SendToMailView();

}
