
class Theme {

  String name;
  String slug;
  String version;
  String preview_url;
  String author;
  String screenshot_url;
  int rating;
  String num_ratings;
  String homepage;
  String description;

  Theme({
		this.name,
		this.slug,
		this.version,
		this.preview_url,
		this.author,
		this.screenshot_url,
		this.rating,
		this.num_ratings,
		this.homepage,
		this.description
});

	Theme.fromJsonMap(Map<String, dynamic> map):
		name = map["name"],
		slug = map["slug"],
		version = map["version"],
		preview_url = map["preview_url"],
		author = map["author"],
		screenshot_url = map["screenshot_url"],
		rating = map["rating"],
		num_ratings = map["num_ratings"],
		homepage = map["homepage"],
		description = map["description"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['slug'] = slug;
		data['version'] = version;
		data['preview_url'] = preview_url;
		data['author'] = author;
		data['screenshot_url'] = screenshot_url;
		data['rating'] = rating;
		data['num_ratings'] = num_ratings;
		data['homepage'] = homepage;
		data['description'] = description;
		return data;
	}
}
