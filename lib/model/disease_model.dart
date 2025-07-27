class DiseaseModel {
  final int idDisease;
  final String description;

  DiseaseModel({
    required this.idDisease,
    required this.description,
  });

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      idDisease: json['id_disease'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_disease': idDisease,
        'description': description,
      };
}
