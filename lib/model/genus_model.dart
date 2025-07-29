class Genus {
  final int id;
  final String name;
  final int idPrevention;
  final int idDisease;

  Genus({
    required this.id,
    required this.name,
    required this.idPrevention,
    required this.idDisease,
  });

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
    id: int.parse(json['id_genus']),
    name: json['name'],
    idPrevention: int.parse(json['id_prevention']),
    idDisease: int.parse(json['id_disease']),
  );
}
