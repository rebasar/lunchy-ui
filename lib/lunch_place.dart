class LunchPlace {
  String name;
  Set<String> aliases;
  String uri;
  String website;

  LunchPlace(this.name, this.aliases, this.uri, this.website);

  factory LunchPlace.fromJson(Map<String, dynamic> json){
    return new LunchPlace(json["name"], json["aliases"], json["uri"], json["website"]);
  }
}