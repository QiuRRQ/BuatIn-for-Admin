import 'package:flutter/material.dart';
import 'package:admin/Models/Domain_Models/DomainSeacrhModel.dart';
import 'package:admin/Screens/Domain/DomainResultScreen.dart';

class DomainSearch extends StatelessWidget{

  var searchParam = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nama Website"),
      ),
      body:
      Container(
            padding: EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  Text.rich(
                      TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Masukkan alamat website yang anda inginkan, seperti:\n',
                                style: TextStyle(
                                  fontSize: 12,
                                )
                            ),
                            TextSpan(
                                text: 'Bukalapak.com, Tokopedia.com, JD.id, dan lain-lain',
                                style: TextStyle(
                                  fontSize: 12,
                                )
                            )
                          ]
                      )
                  ),
                  TextFormField(
                    controller: searchParam,
                    decoration: InputDecoration(
                        labelText: 'Nama Website'
                    ),
                  ),
                  ButtonTheme.bar(
                    child: new ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // BUTTON PERTAMA
                        new RaisedButton(
                          //DENGAN TEXT LIHAT DETAI
                            child: const Text('Periksa Nama',),
                            textColor: Colors.white,
                            onPressed: (){
                              // ignore: unnecessary_statements
                              saveData();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DomainResultScreen()));
                            }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )

    );

  }

  saveData(){
    print("search : "+searchParam.text.toString());
    setData(searchParam.text.toString());
  }
}