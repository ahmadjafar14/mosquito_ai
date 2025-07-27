import 'package:flutter/material.dart';
import 'dart:io';

class ScanResultPage extends StatelessWidget {
  final Map<String, File?> imageFiles;

  const ScanResultPage({Key? key, required this.imageFiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<File> validImages = imageFiles.values.whereType<File>().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Card Informasi
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.grey),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aedes Aegypti',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Common name: Yellow Fever Mosquito',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(Icons.bug_report, color: Colors.blue),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('Confidence Level'),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.94,
                      backgroundColor: Colors.grey[200],
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 4),
                    const Text('94%', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Icon(Icons.calendar_today, size: 20, color: Colors.blue),
                        SizedBox(width: 10),
                        Text("June 15, 2023"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.access_time, size: 20, color: Colors.blue),
                        SizedBox(width: 10),
                        Text("2:45 PM"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.location_on, size: 20, color: Colors.blue),
                        SizedBox(width: 10),
                        Text("Sumbersari, Jember"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.warning_amber, color: Colors.red),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Disease Risk",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Known to carry Yellow Fever, Dengue Fever, and Zika virus.",
                                  style: TextStyle(height: 1.4),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.health_and_safety, color: Colors.blue),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Prevention Tips",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text("• Remove standing water\n• Use mosquito repellent\n• Wear long-sleeved clothing"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Card Gambar
            if (validImages.isNotEmpty) ...[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.grey),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Scan Images",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: validImages.map((file) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              file,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Tombol di bawah card gambar
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Simpan ke histori
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Save to History"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Back"),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
