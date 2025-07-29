class ScanHistory {
  final int id;
  final int userId;
  final int attachmentId;

  ScanHistory({
    required this.id,
    required this.userId,
    required this.attachmentId,
  });

  factory ScanHistory.fromJson(Map<String, dynamic> json) => ScanHistory(
    id: int.parse(json['id_history']),
    userId: int.parse(json['id_user']),
    attachmentId: int.parse(json['id_attachment']),
  );
}
