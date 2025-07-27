import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_mosquito_cam/model/user_model.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2/api_flutter'; // ganti sesuai URL API kamu

  // Fungsi GET semua user
  static Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/get_users.php'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Fungsi POST untuk tambah user
  static Future<bool> addUser(String name, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_user.php'),
      body: {
        'name': name,
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return result['success'] == true;
    } else {
      throw Exception('Failed to add user');
    }
  }

  // Fungsi Hapus user
  static Future<bool> deleteUser(String id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/delete_user.php'),
      body: {'id': id},
    );

    var result = json.decode(response.body);
    return result['success'] == true;
  }
}
