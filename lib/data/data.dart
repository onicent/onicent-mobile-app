class DataUser {
  final String name;
  final String email;

  DataUser(this.name, this.email);

  DataUser.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };
}
