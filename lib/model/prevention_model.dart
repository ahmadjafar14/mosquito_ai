class Prevention {
  final int id;
  final String description;

  Prevention({
    required this.id,
    required this.description,
  });

  factory Prevention.fromJson(Map<String, dynamic> json) => Prevention(
    id: int.parse(json['id_prevention']),
    description: json['description'],
  );
}
