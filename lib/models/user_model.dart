class User {
  final String id;
  final String email;
  final bool emailVerification;
  final int registration;
  final String name;
  final List<dynamic> roles;

  User(this.id, this.email, this.emailVerification, this.registration,
      this.name, this.roles);

  User.fromJson(Map<String, dynamic> json)
      : id = json['\$id'],
        email = json['email'],
        emailVerification = json['emailVerification'],
        registration = json['registration'],
        name = json['name'],
        roles = json['roles'];
}
