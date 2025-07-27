import 'package:flutter/material.dart';

class ScanDetailPage extends StatefulWidget {
  final dynamic data;

  const ScanDetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ScanDetailPage> createState() => _ScanDetailPageState();
}

class _ScanDetailPageState extends State<ScanDetailPage> {
  @override
  Widget build(BuildContext context) {
    final item = widget.data;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Scan Detail'),
        leading: const BackButton(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card with name and confidence
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Top Row: Title + Image.asset
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Aedes Aegypti',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Common name: Yellow Fever Mosquito',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue, // warna background lingkaran
                          ),
                          child: Image.asset(
                            'assets/img/mosquito.png',
                            height: 36,
                            width: 36,
                            color: Colors.white, // warna gambar jadi putih
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    /// Confidence
                    const Text("Confidence Level"),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: 0.94,
                            backgroundColor: Colors.grey[300],
                            color: Colors.blue,
                            minHeight: 6,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "94%",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    /// Scan Date
                    Row(
                      children: const [
                        Icon(
                          Icons.calendar_today,
                          size: 18,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'June 15, 2023',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// Scan Time
                    Row(
                      children: const [
                        Icon(Icons.access_time, size: 18, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          '2:45 PM',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// Location
                    Row(
                      children: const [
                        Icon(Icons.location_on, size: 18, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Sumbersari, Jember',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Disease Risk
            Card(
              color: Colors.red.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.warning, color: Colors.red),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Disease Risk',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Known to carry Yellow Fever, Dengue Fever, and Zika virus.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// Prevention Tips
            Card(
              color: Colors.blue.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.shield, color: Colors.blue),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prevention Tips',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '• Remove standing water\n• Use mosquito repellent\n• Wear long-sleeved clothing',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Scan Images (4 only)
            const Text(
              'Scan Images',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              children: List.generate(4, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img/sample${index + 1}.png',
                      ), // ganti dengan gambar scan kamu
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            /// Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Share logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Share Result'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Back to History'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
