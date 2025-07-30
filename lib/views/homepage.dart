import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mosquito_cam/model/home_model.dart';
import 'package:smart_mosquito_cam/views/auth/loginpage.dart';
import 'package:smart_mosquito_cam/views/auth/profilepage.dart';
import 'package:smart_mosquito_cam/views/guidebook.dart';
import 'package:smart_mosquito_cam/views/scanhistory.dart';
import 'package:smart_mosquito_cam/views/scanpage.dart';

class HomePage extends StatelessWidget {
  final Color blue = const Color(0xFF3B82F6);
  final TextStyle statNumberStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFF3B82F6),
  );

  final List<ScanStat> scanStats = getDummyStats();
  final List<RecentActivityModel> recentActivities = getDummyActivities();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color(0xFF3B82F6),
        child: Column(
          children: [
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: FutureBuilder(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }

                  final prefs = snapshot.data!;
                  final username = prefs.getString('username') ?? 'User';

                  return Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/img/1w.png'),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.person_2, color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProfilePage()),
                );
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
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
                                Navigator.pop(context); // tutup dialog
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
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    const Text(
                      "Smart Mosquito Cam",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Identify mosquito species instantly",
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _menuItem(Icons.camera_alt, "Scan Mosquito", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScanPage()),
                    );
                  }),
                  _menuItem(Icons.history, "Scan History", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScanHistoryPage(),
                      ),
                    );
                  }),
                  _menuItem(Icons.menu_book, "Guide Book", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GuidePage()),
                    );
                  }),
                  _menuItem(Icons.logout, "Logout", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F9FC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quick Stats",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          scanStats
                              .map((e) => _statItem(e.value, e.label))
                              .toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Recent Activity",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...recentActivities.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _activityItem(e.icon, e.title, e.subtitle, e.color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF0F7FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFF3B82F6),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: statNumberStyle),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ],
    );
  }

  Widget _activityItem(
    IconData icon,
    String title,
    String subtitle,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
