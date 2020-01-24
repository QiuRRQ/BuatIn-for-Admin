import 'package:shared_preferences/shared_preferences.dart';

setData(String data, String Harga) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('Paket', data);
  prefs.setString('PaketHarga', Harga);
}