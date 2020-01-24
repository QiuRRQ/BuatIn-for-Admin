
class Info {

  int page;
  int pages;
  int results;

	Info.fromJsonMap(Map<String, dynamic> map): 
		page = map["page"],
		pages = map["pages"],
		results = map["results"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['page'] = page;
		data['pages'] = pages;
		data['results'] = results;
		return data;
	}
}
