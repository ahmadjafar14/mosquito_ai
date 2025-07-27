class UserModel {
  final int idUser;
  final String name;
  final String password;
  final String numberPhone;

  UserModel({
    required this.idUser,
    required this.name,
    required this.password,
    required this.numberPhone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['id_user'],
      name: json['name'],
      password: json['password'],
      numberPhone: json['number_phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_user': idUser,
        'name': name,
        'password': password,
        'number_phone': numberPhone,
      };
}
