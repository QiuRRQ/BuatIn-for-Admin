import 'package:shared_preferences/shared_preferences.dart';

setData(String data) async {
  print("savedom :"+data);
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('searchDomain', data);
}