
import 'package:flutter/material.dart';
import 'package:admin/Models/Domain_Models/DomainResultModel.dart';
import 'package:admin/Screens/PrintOutPrice/PrintOutPriceScreen.dart';

class DomainResultView extends DomainResultModel{
  String harga;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body:
      Container(
        padding: const EdgeInsets.all(10.0),
        child: isLoading ?
        Center(
          child: CircularProgressIndicator(),
        ) :
        new ListView.builder(
          itemCount: data == null ? 0:data.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min, children: <Widget>[
                  //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
                  ListTile(

                    title: Text(data[index]["domain"], style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                    subtitle:
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Harga : ', style: TextStyle(fontWeight: FontWeight.bold),),
                            pricingDomain(data[index]["price"])
                          ],
                        ),
                      ],
                    ),
                  ),
                  //TERAKHIR, MEMBUAT BUTTON
                  ButtonTheme.bar(
                    child: data[index]["status"]=="TAMBAHKAN KE CART" ?
                    ButtonBar(
                      children: <Widget>[
                        // BUTTON PERTAMA
                        new RaisedButton(
                          //DENGAN TEXT LIHAT DETAI
                            child: const Text('PILIH INI',),
                            textColor: Colors.white,
                            onPressed: (){
                              setData(data[index]["domain"], data[index]["price"]);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PrintOutPriceScreen()));
                            }
                        )
                      ],
                    ):
                    new RichText(
                      text: TextSpan(
                          style: TextStyle(
                              wordSpacing: 15
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Nama Sudah Terpakai",
                                style: TextStyle(
                                    wordSpacing: 1,
                                    color: Colors.red,
                                    fontSize: 15.0
                                )
                            )
                          ]
                      ),
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

  pricingDomain(String data){
    List temp = data.split("Rp. ");
    if(temp.length<=2){
      harga = temp[1];
      return Text("Rp."+temp[1], style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),);
    }
    else{
      harga = temp[2];
      return RichText(
        text: TextSpan(
            style: TextStyle(
                wordSpacing: 15
            ),
            children: <TextSpan>[
              TextSpan(
                  text: "Rp."+temp[1],
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0
                  )
              ),
              TextSpan(
                  text: " "
              ),
              TextSpan(
                  text: "Rp."+temp[2],
                  style: TextStyle(
                      letterSpacing: 2,
                      wordSpacing: 1,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0
                  )
              )
            ]
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    this.getDomain();
  }

}

