class PreventionModel {
  final int idPrevention;
  final String description;

  PreventionModel({
    required this.idPrevention,
    required this.description,
  });

  factory PreventionModel.fromJson(Map<String, dynamic> json) {
    return PreventionModel(
      idPrevention: json['id_prevention'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_prevention': idPrevention,
        'description': description,
      };
}
