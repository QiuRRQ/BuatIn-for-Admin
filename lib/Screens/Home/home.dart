
import 'dart:collection';

import 'package:admin/Models/History/Pemesanan.dart';
import 'package:admin/Screens/History/DetailHistoryScreen.dart';
import 'package:admin/Screens/SendToMail/SendToMailScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin/Models/LoginPageModel/authentication.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class home extends StatefulWidget {


  home({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  String name = "";
  String email = "";
  String role = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(name),
              accountEmail: new Text(email),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("P"),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.home),
              title: new Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new ListTile(
              leading: new Icon(Icons.people),
              title: new Text("Profile"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/c");
              },
            ),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.close),
              title: new Text("Log Out"),
              onTap: (){
                _signOut();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body:
      Column(
        children: <Widget>[
          TextFormField(
            controller: searchParam,
            decoration: InputDecoration(
                hintText: "Search by ID",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _getPemesanan(searchParam.text.toString());
                    })),
          ),
          new Expanded(
            child: ListView.builder(
            shrinkWrap: true,
            itemCount: listOrder == null ? 0:listOrder.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, children: <Widget>[
                    //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
                    ListTile(

                      title: Text(listOrder[index].domain, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                      subtitle:
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Harga : ${listOrder[index].harga}', style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Paket Layanan : ${listOrder[index].layanan}', style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Status : ${listOrder[index].status}', style: TextStyle(fontWeight: FontWeight.bold),),
                              admin
                                  ?
                              new DropdownButton(
                                value: currentStatus,
                                items: dropDownMenuItems,
                                onChanged: (String newValue){
                                  changedDropDownItem(newValue, listOrder[index]);
                                },
                              )
                                  : Text(""),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                  ),
                ),
              );
            },
          ),
          )
        ],
      )


    );

  }

  var searchParam = TextEditingController();

  bool isLoading = true;
  bool admin = false;
  List<Pemesanan> listOrder = new List<Pemesanan>();
  var data;
  List status = ["Select Option","park", "Process", "Deliver"];
  List<DropdownMenuItem<String>> dropDownMenuItems;
  String currentStatus;

  _sendMail(String to, String body, String domain) async{
    String username = 'azizurrohim13@gmail.com';
    String password = 'autopower123';

    final smtpServer = gmail(username, password);

    final message = new Message()
      ..from = new Address(username, 'ADMIN BuatIn')
      ..recipients.add('$to')
      ..subject = '[BuatIn]NOTIFICATION'
      ..text = '$body'
      ..html = "<h1>NOTIFICATION</h1>\n<p>$body</p>\n<a href='$domain'>$domain</a>";

    final sendReports = await send(message, smtpServer);

    if(sendReports != null){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: new Text("Success"),
              content: new Text("Notification send Suceess"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: new Text("Close")
                )
              ],
            );
          },
      );
    }
    //ToDO:bikin showdialog kalau ada waktu
  }

  _getPemesanan([String keyword])async{
    var prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('user');
    String role = prefs.getString('role');
    QuerySnapshot querySnapshot;
    DocumentSnapshot documentSnapshot;

    CollectionReference ref = Firestore.instance.collection('pemesanan');
    if(role == "admin") {
      if(keyword == null){
        querySnapshot = await ref.getDocuments();
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
      }else{
        documentSnapshot = await ref.document(keyword).get();
        data = documentSnapshot.data;
        print(data);
        HashMap<String, Pemesanan> eventsHashMap = new HashMap<String, Pemesanan>();
        eventsHashMap.putIfAbsent(documentSnapshot.documentID, () => new Pemesanan(
            domain: data['domain'],
            documentId: documentSnapshot.documentID,
            harga: data['harga'].toString(),
            layanan: data['layanan'],
            status: data['status'],
            template: data['template'],
            uid: data['uid']
        ));

        setState(() {
          if(role == "admin"){
            admin = true;
          }
          listOrder =  eventsHashMap.values.toList();
          print("order length : ${listOrder.length.toString()}");
          isLoading = false;
        });

      }
    }

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



  changedDropDownItem(String selectedStatus, Pemesanan order) async{

    if(selectedStatus != "Select Option"){
      CollectionReference updatePemesanan = Firestore.instance.collection('pemesanan');

      updatePemesanan.document(order.documentId).updateData(
          {
            "status" : selectedStatus
          }
      ).catchError((e) {
        print(e);
      });


      //getting email user yang pesan
      CollectionReference ref = Firestore.instance.collection('users');
      QuerySnapshot querySnapshot = await ref.where("uid", isEqualTo: order.uid).getDocuments();

      String body = "";
      if(selectedStatus == "Process"){
        body = "Website anda yang bernama sedang dalam pengerjaan";
        _sendMail(querySnapshot.documents[0]['email'], body, "");
      }else{
        body = "Website anda yang bernama telah selesai "
            "harap di cek dengan klik alamat tersebut jika ada issue Reply email ini, jika tidak ada issue harap konfirmasi melalui aplikasi";

        _sendMail(querySnapshot.documents[0]['email'], body, order.domain);
      }
      //send email

    }

    print("Selected $selectedStatus, refresh the UI");

    setState(() {
      if(searchParam.text.toString() == ""){
        _getPemesanan();
      }else{
        _getPemesanan(searchParam.text.toString());
      }
    });

  }

  _getUser()async{
    var prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('user');
    CollectionReference ref = Firestore.instance.collection('users');
    QuerySnapshot querySnapshot = await ref.where("uid", isEqualTo: uid).getDocuments();
    prefs.setString('role', querySnapshot.documents[0]['role']);
    setState(() {
      this.email = querySnapshot.documents[0]['email'];
      this.name = querySnapshot.documents[0]['name'];
      this.role = querySnapshot.documents[0]['role'];
    });

  }

  _loader()async{
    await _getUser();
    await _getPemesanan();
    dropDownMenuItems = getDropDownMenuItems();
    currentStatus = dropDownMenuItems[0].value;
  }

  @override
  void initState() {
    _loader();
    super.initState();
  }

  void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {}
  }
}


