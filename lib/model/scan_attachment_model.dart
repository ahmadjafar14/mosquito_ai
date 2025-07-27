class ScanAttachmentModel {
  final int idAttachment;
  final String name;
  final int idGenus;

  ScanAttachmentModel({
    required this.idAttachment,
    required this.name,
    required this.idGenus,
  });

  factory ScanAttachmentModel.fromJson(Map<String, dynamic> json) {
    return ScanAttachmentModel(
      idAttachment: json['id_attachment'],
      name: json['name'],
      idGenus: json['id_genus'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_attachment': idAttachment,
        'name': name,
        'id_genus': idGenus,
      };
}
