class UserModel {
  String? name;
  String? email;
  String? password;
  String? id;

  UserModel({
    this.email,
    this.name,
    this.password,
    this.id,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    password = json['password'];
    name = json['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'password': password,
      'email': email,
    };
  }
}
