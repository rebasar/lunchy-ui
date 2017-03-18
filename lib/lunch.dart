class Lunch {
  final List<LunchItem> items;
  final String validFrom;
  final String validUntil;

  Lunch(this.items, this.validFrom, this.validUntil);

  factory Lunch.fromJson(Map<String, dynamic> json){
    final String validFrom = json["validFrom"];
    final String validUntil = json["validUntil"];
    final List<Map<String, dynamic>> rawItems = json["items"];
    final List<LunchItem> items = rawItems.map((m) => new LunchItem.fromJson(m)).toList();
    return new Lunch(items, validFrom, validUntil);
  }
}

class LunchItem {
  String title;
  String description;
  int price;

  LunchItem(this.title, this.description, this.price);

  factory LunchItem.fromJson(Map<String, dynamic> json){
    final String title = json["title"];
    final String description = json["description"];
    final int price = json["price"];
    return new LunchItem(title, description, price);
  }

  String toMarkdown() {
    String result = "- **$title**";
    if(description != null){
      result += ": $description";
    }
    if(price != null){
      result += " ($price SEK)";
    }
    return result;
  }


}