class User {
  final int id;
  final String username;
  final String name;
  final String numberPhone;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.numberPhone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id_user'],
        username: json['username'],
        name: json['name'],
        numberPhone: json['number_phone'], // ✅ perhatikan: "number_phone" bukan "numberPhone"
      );
}
