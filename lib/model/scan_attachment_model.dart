class ScanAttachment {
  final int id;
  final String name;
  final int idGenus;

  ScanAttachment({
    required this.id,
    required this.name,
    required this.idGenus,
  });

  factory ScanAttachment.fromJson(Map<String, dynamic> json) => ScanAttachment(
    id: int.parse(json['id_attachment']),
    name: json['name'],
    idGenus: int.parse(json['id_genus']),
  );
}
