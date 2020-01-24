
import 'package:flutter/material.dart';
import 'package:admin/Models/History/HistoryModel.dart';
import 'package:admin/Screens/DetailSiteForm/DetailSiteFormScreen.dart';
import 'package:admin/Screens/History/DetailHistoryScreen.dart';
import 'package:admin/Screens/SendToMail/SendToMailScreen.dart';

class HistoryView extends HistoryModel{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History Pesanan"),
      ),
      body:
      Container(
        padding: const EdgeInsets.all(10.0),
        child: isLoading ?
        Center(
          child: CircularProgressIndicator(),
        ) :
        new ListView.builder(
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
                                changedDropDownItem(newValue, listOrder[index].documentId);
                              },
                            )
                                : Text(""),
                          ],
                        ),
                        admin
                            ?
                        FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailHistoryScreen(listOrder[index])));
                            },
                            child: Text("Lihat Detail")
                        )
                            :
                        FlatButton(
                            onPressed: (){
                              listOrder[index].status == "park"
                                  ?  Navigator.push(context, MaterialPageRoute(builder: (context) => SendToMailScreen(listOrder[index].documentId)))
                                  : Navigator.push(context, MaterialPageRoute(builder: (context) => DetailHistoryScreen(listOrder[index])));
                            },
                            child: Text("Lihat Detail")
                        )
                      ],
                    ),
                  ),
                ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}