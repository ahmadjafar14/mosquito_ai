import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mosquito_cam/views/auth/loginpage.dart';

class ProfilePage extends StatelessWidget {
  // Ambil semua data user dari SharedPreferences
  Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name') ?? 'Nama tidak ditemukan',
      'username': prefs.getString('username') ?? 'Username tidak ditemukan',
      'phone': prefs.getString('number_phone') ?? 'Nomor HP tidak ditemukan',
    };
  }

  // Fungsi logout
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Hapus semua data user
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final data = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Profil Saya'),
            centerTitle: true,
            backgroundColor: Colors.blue[900],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue[800],
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  data['name']!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "@${data['username']}",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 5),
                Text(
                  data['phone']!,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              title: const Text("Konfirmasi Logout"),
                              content: const Text(
                                "Apakah kamu yakin ingin keluar dari aplikasi?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Batal"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.clear();
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const LoginPage(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: const Text(
                                    "Keluar",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                      );
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Keluar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
