import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:admin/Models/theme/response.dart';
import 'package:admin/Models/theme/Theme.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:admin/Repository/themes_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';


const BASE_URL = "http://api.wordpress.org/themes/info/1.1/?action=query_themes&";

// ignore: non_constant_identifier_names
final String search_Param = "";

class ThemeProdRepository implements ThemeRepository {
  @override
  Future<Response> fetchMovies(int pageNumber, String searchParam) async {
    http.Response response = await http.get(BASE_URL +
        "request[search]=" +
        searchParam +
        "&request[page]=" +
        pageNumber.toString());

    var myres = jsonDecode(response.body);
    Response respo = Response.fromJsonMap(myres);
    print(respo);
    //final SharedPreferences prefs = await SharedPreferences.getInstance();

    //prefs.setString(search_Param, searchParam);

    return respo;
  }
}
