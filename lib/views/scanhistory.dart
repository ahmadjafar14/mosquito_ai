import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_mosquito_cam/views/scandetail.dart';

class ScanHistoryPage extends StatefulWidget {
  @override
  _ScanHistoryPageState createState() => _ScanHistoryPageState();
}

class _ScanHistoryPageState extends State<ScanHistoryPage> {
  List<Map<String, dynamic>> scanHistory = [
    {
      'name': 'Aedes aegypti',
      'date': DateTime.now().subtract(Duration(hours: 2)),
      'confidence': 92
    },
    {
      'name': 'Anopheles',
      'date': DateTime.now().subtract(Duration(days: 1, hours: 5)),
      'confidence': 87
    },
    {
      'name': 'Culex',
      'date': DateTime.now().subtract(Duration(days: 3)),
      'confidence': 74
    },
  ];

  String formatDate(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy – HH:mm').format(dateTime);
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return now.day == date.day &&
        now.month == date.month &&
        now.year == date.year;
  }

  bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return yesterday.day == date.day &&
        yesterday.month == date.month &&
        yesterday.year == date.year;
  }

  List<Map<String, dynamic>> getTodayScans() =>
      scanHistory.where((item) => isToday(item['date'])).toList();

  List<Map<String, dynamic>> getYesterdayScans() =>
      scanHistory.where((item) => isYesterday(item['date'])).toList();

  List<Map<String, dynamic>> getOlderScans() =>
      scanHistory
          .where((item) =>
              !isToday(item['date']) && !isYesterday(item['date']))
          .toList();

  Widget buildScanList(String title, List<Map<String, dynamic>> scans) {
    if (scans.isEmpty) return SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...scans.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ScanDetailPage(data: item),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.5),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Kiri: nama & tanggal
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        formatDate(item['date']),
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),

                  /// Kanan: confidence % & icon
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${item['confidence']}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  )
                ],
              ),
            ),
          );
        }).toList(),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final todayDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Scan History"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Tanggal + See All
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todayDate,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // aksi ketika See All ditekan
                  },
                  child: Text("See All"),
                ),
              ],
            ),
            SizedBox(height: 12),

            /// History List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildScanList("Hari Ini", getTodayScans()),
                    buildScanList("Kemarin", getYesterdayScans()),
                    buildScanList("Sebelumnya", getOlderScans()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
