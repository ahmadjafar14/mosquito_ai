class GenusModel {
  final int idGenus;
  final String name;
  final int idPrevention;
  final int idDisease;

  GenusModel({
    required this.idGenus,
    required this.name,
    required this.idPrevention,
    required this.idDisease,
  });

  factory GenusModel.fromJson(Map<String, dynamic> json) {
    return GenusModel(
      idGenus: json['id_genus'],
      name: json['name'],
      idPrevention: json['id_prevention'],
      idDisease: json['id_disease'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_genus': idGenus,
        'name': name,
        'id_prevention': idPrevention,
        'id_disease': idDisease,
      };
}

