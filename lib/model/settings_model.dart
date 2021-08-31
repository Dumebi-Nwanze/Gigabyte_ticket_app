class Settings {
  late int id;
  late String link;

  Settings(this.id, this.link);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'link': link,
    };
    return map;
  }

  Settings.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    link = map['link'];
  }
}
