import 'package:flutter/material.dart';
import 'package:admin/Models/Hosting_models/Hosting_model.dart';
import 'package:admin/Screens/Domain/DomainSearch.dart';

class Paket_3 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            RichText(
                text: TextSpan(
                    text: "Paket Diamond \n",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24
                    )
                )
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                      wordSpacing: 15
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Rp.174,265",
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough
                        )
                    ),
                    TextSpan(
                        text: " "
                    ),
                    TextSpan(
                        text: "Diskon 78%",
                        style: TextStyle(
                            letterSpacing: 2,
                            wordSpacing: 1,
                            color: Colors.redAccent
                        )
                    )
                  ]
              ),
            ),
            Text("\n Rp. 37,695/Bulan \n\n\n\n"),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: " Fitur :\n\n\n",
                        style: TextStyle(
                            color: Colors.black
                        )
                    ),
                    TextSpan(
                        text: "- Semua Fitur di paket platinum\n\n",
                        style: TextStyle(
                            color: Colors.black
                        )
                    ),
                    TextSpan(
                        text: "- Backup Harian sehingga kemungkinan website down(tak dapat diakses) sangat minim\n",
                        style: TextStyle(
                            color: Colors.black
                        )
                    )
                  ]
              ),
            ),
            ButtonTheme.bar(
              child: new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  // BUTTON PERTAMA
                  new RaisedButton(
                    //DENGAN TEXT LIHAT DETAI
                    child: const Text('PILIH PAKET',),
                    textColor: Colors.white,
                    onPressed: (){
                      saveData();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DomainSearch()));
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  saveData(){
    setData('Paket Diamond','Rp. 37,695/Bulan');
  }

}