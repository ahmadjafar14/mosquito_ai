import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';
import '../model/scan_attachment_model.dart';
import '../model/scan_history_model.dart';
import '../model/genus_model.dart';
import '../model/disease_model.dart';
import '../model/prevention_model.dart';

class ApiService {
  static const baseUrl = "http://reyhanzaynuri.site:8000";

  static Future<List<ScanHistory>> getHistoryByUser(int userId) async {
    final response = await http.get(Uri.parse("$baseUrl/history/$userId"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => ScanHistory.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil history");
    }
  }

  static Future<ScanAttachment> getAttachmentById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/attachment/$id"));
    if (response.statusCode == 200) {
      return ScanAttachment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal mengambil attachment");
    }
  }

  static Future<Genus> getGenusById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/genus/$id"));
    if (response.statusCode == 200) {
      return Genus.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal mengambil genus");
    }
  }

  static Future<Disease> getDiseaseById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/disease/$id"));
    if (response.statusCode == 200) {
      return Disease.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal mengambil disease");
    }
  }

  static Future<Prevention> getPreventionById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/prevention/$id"));
    if (response.statusCode == 200) {
      return Prevention.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal mengambil prevention");
    }
  }

  static Future<User?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/login"), // ✅ diperbaiki dari "/login.php"
      headers: {'Content-Type': 'application/json'}, // ✅ karena kamu kirim JSON
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['user'] != null) {
        return User.fromJson(data['user']);
      }
    }

    return null;
  }

  // REGISTER
static Future<bool> register(String name, String username, String phone, String password) async {
  final response = await http.post(
    Uri.parse("$baseUrl/api/register"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'name': name,
      'username': username,
      'number_phone': phone,
      'password': password,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return data['message'] == 'Registrasi berhasil';
  }

  return false;
}

}
