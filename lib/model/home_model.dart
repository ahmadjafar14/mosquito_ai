import 'package:flutter/material.dart';

/// Model untuk statistik pemindaian (scan)
class ScanStat {
  final String label;
  final String value;

  ScanStat({required this.label, required this.value});
}

/// Model untuk aktivitas terakhir yang ditampilkan di HomePage
class RecentActivityModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  RecentActivityModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
}

/// Dummy data statistik
List<ScanStat> getDummyStats() {
  return [
    ScanStat(label: "Scans Today", value: "12"),
    ScanStat(label: "Total Scans", value: "67"),
    ScanStat(label: "Species Found", value: "7"),
  ];
}

/// Dummy data aktivitas terakhir
List<RecentActivityModel> getDummyActivities() {
  return [
    RecentActivityModel(
      icon: Icons.check_circle,
      title: "Aedes Aegypti",
      subtitle: "Identified 2 hours ago",
      color: const Color(0xFF3B82F6),
    ),
    RecentActivityModel(
      icon: Icons.camera_alt,
      title: "Scan Completed",
      subtitle: "Yesterday at 3:40 PM",
      color: Colors.grey,
    ),
  ];
}
