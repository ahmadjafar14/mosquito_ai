class ScanHistoryModel {
  final int idHistory;
  final String createAt;
  final String updateAt;
  final int idUser;
  final int idAttachment;

  ScanHistoryModel({
    required this.idHistory,
    required this.createAt,
    required this.updateAt,
    required this.idUser,
    required this.idAttachment,
  });

  factory ScanHistoryModel.fromJson(Map<String, dynamic> json) {
    return ScanHistoryModel(
      idHistory: json['id_history'],
      createAt: json['create_at'],
      updateAt: json['update_at'],
      idUser: json['id_user'],
      idAttachment: json['id_attachment'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_history': idHistory,
        'create_at': createAt,
        'update_at': updateAt,
        'id_user': idUser,
        'id_attachment': idAttachment,
      };
}
