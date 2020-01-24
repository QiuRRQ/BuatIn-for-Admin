import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin/Screens/Domain/DomainResultScreen.dart';
import 'package:admin/Screens/PrintOutPrice/PrintOutPriceScreen.dart';

abstract class DomainResultModel extends State<DomainResultScreen>{

  List data;
  bool isLoading = true;

  getDomain()async{
    var prefs = await SharedPreferences.getInstance();
    String searchParam = prefs.getString('searchDomain');
    print(searchParam);

    String url = "https://evening-oasis-51565.herokuapp.com/?domain="+searchParam;
    var res = await http.get(Uri.encodeFull(url), headers: { 'accept':'application/json' });

    setState(() {
      var content = json.decode(res.body);
      data = content;
      isLoading = false;
    });
  }

  setData(String data, String harga)async{
    List temp = harga.split("Rp. ");

    var prefs = await SharedPreferences.getInstance();
    prefs.setString("Domain", data);
    print("harga domain: $harga" );
    if(temp.length<=2){
      prefs.setString('DomainHarga', temp[1]);
    }else{
      prefs.setString('DomainHarga', temp[2]);
    }

  }

}