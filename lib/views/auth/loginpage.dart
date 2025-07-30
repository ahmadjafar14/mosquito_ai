import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mosquito_cam/services/api_sevices.dart';
import 'package:smart_mosquito_cam/views/auth/registerpage.dart';
import 'package:smart_mosquito_cam/views/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

void handleLogin() async {
  setState(() => isLoading = true);

  final user = await ApiService.login(
    usernameController.text.trim(),
    passwordController.text.trim(),
  );

  setState(() => isLoading = false);

  if (user != null) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("user_id", user.id);
    await prefs.setString("username", user.username);
    await prefs.setString("name", user.name);
    await prefs.setString("number_phone", user.numberPhone);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("Berhasil Login"),
        content: const Text("Selamat datang kembali!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            },
            child: const Text("Lanjut"),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text("Login Gagal ❌"),
        content: const Text(
          "Username atau password salah. Silakan coba lagi.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/img/1w.png'),
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                "Smart Mosquito Cam",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "Detect and identify mosquitoes with AI",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Email or username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot password?"),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading ? null : handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 91, 144, 213),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:
                      isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Login",style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterPage(),
                          ),
                        ),
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
