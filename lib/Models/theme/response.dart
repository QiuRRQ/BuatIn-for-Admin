import 'package:admin/Models/theme/info.dart';
import 'package:admin/Models/theme/Theme.dart' as a;

class Response {

  Info info;
  List<a.Theme> themes;

	Response.fromJsonMap(Map<String, dynamic> map): 
		info = Info.fromJsonMap(map["info"]),
		themes = List<a.Theme>.from(map["themes"].map((it) => a.Theme.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['info'] = info == null ? null : info.toJson();
		data['themes'] = themes != null ? 
			this.themes.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
