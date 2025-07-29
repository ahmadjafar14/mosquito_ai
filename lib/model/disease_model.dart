class Disease {
  final int id;
  final String description;

  Disease({
    required this.id,
    required this.description,
  });

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
    id: int.parse(json['id_disease']),
    description: json['description'],
  );
}
