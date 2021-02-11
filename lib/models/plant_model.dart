class Plant {
  final String id;
  final String collection;
  final Map<String, dynamic> permissions;

  final String name;
  final int interval;

  Plant(this.id, this.collection, this.permissions, this.name, this.interval);

  Plant.fromJson(Map<String, dynamic> json)
      : id = json['\$id'],
        collection = json['collection'],
        permissions = json['\$permissions'],
        name = json['name'],
        interval = json['interval'];
}
