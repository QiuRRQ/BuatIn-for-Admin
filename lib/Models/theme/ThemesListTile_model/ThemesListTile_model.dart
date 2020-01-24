import 'package:shared_preferences/shared_preferences.dart';

setData(String data) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('Tema', data);
}