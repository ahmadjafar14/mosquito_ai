import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> guideSteps = [
      {
        "title": "1. How to Scan a Mosquito",
        "description":
            "Take 4 photos from different angles and press Analyze. Make sure the mosquito is clearly visible and focus.",
        "note": "Camera required",
        "icon": Icons.camera_alt,
      },
      {
        "title": "2. Upload Existing Photos",
        "description":
            "If you already have photos, you can upload them from your gallery. Select high-quality images for better results.",
        "note": "Gallery access",
        "icon": Icons.upload_file,
      },
      {
        "title": "3. Review Analysis Results",
        "description":
            "After analysis, you’ll see the mosquito species identification along with risk assessment and recommendations.",
        "note": "Results available",
        "icon": Icons.analytics,
      },
      {
        "title": "4. Share Your Findings",
        "description":
            "Share the results with friends, family, or health professionals. Export a PDF report or send directly from the app.",
        "note": "Sharing options",
        "icon": Icons.share,
      },
      {
        "title": "5. Access History",
        "description":
            "View all your previous scans in the history section. Compare results and track mosquito encounters over time.",
        "note": "History details",
        "icon": Icons.history,
      },
      {
        "title": "6. Set Up Alerts",
        "description":
            "Configure notifications for high-risk mosquito alerts in your area. Stay informed about potential disease vectors.",
        "note": "Notifications",
        "icon": Icons.notifications_active,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Guide Book", style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to the Guide",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Gap(8),
                Text(
                  "Follow these simple steps to get the most out of our app. Each instruction is designed to help you navigate and use all features effectively.",
                ),
              ],
            ),
          ),
          const Gap(16),
          ...guideSteps.map((step) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(
                          step['icon'],
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              step['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              step['description'],
                              style: const TextStyle(fontSize: 13),
                            ),
                            const Gap(8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                step['note'],
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
