class Users {
  final String username;
  final String password;
  final DateTime date_of_birth;
  String? id;

  // final String? password;

  Users(this.username, this.password, this.date_of_birth, this.id);
  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'date_of_birth': date_of_birth,
        'userid': id
      };
  Users.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        date_of_birth = json['date_of_birth'],
        id = json['userid'];
}
