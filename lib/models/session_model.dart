class Session {
  final String id;
  final String type;
  final int expire;

  Session(this.id, this.type, this.expire);

  Session.fromJson(Map<String, dynamic> json)
      : id = json['\$id'],
        type = json['type'],
        expire = int.parse(json['expire']);
}
