import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mosquito_cam/views/auth/loginpage.dart';

class ProfilePage extends StatelessWidget {
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => LoginPage()));
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUsername(),
      builder: (context, snapshot) {
        final username = snapshot.data ?? 'User';
        return Scaffold(
          appBar: AppBar(
            title: Text('Profil Saya'),
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
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => logout(context),
                    icon: Icon(Icons.logout),
                    label: Text('Keluar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
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
