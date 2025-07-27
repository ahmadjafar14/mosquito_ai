
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';

import 'package:smart_mosquito_cam/views/scanresult.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final Color blueColor = Color(0xFF3B82F6);
  final ImagePicker _picker = ImagePicker();

  Map<String, File?> imageFiles = {
    "Right Side": null,
    "Left Side": null,
    "Top View": null,
    "Bottom View": null,
  };

  Future<void> _pickImage(String title) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take Photo'),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  setState(() {
                    imageFiles[title] = File(image.path);
                  });
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Choose from Gallery'),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    imageFiles[title] = File(image.path);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageBox(String title) {
    return GestureDetector(
      onTap: () => _pickImage(title),
      child: DottedBorder(
        color: blueColor,
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        dashPattern: [6, 3],
        strokeWidth: 1.5,
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            children: [
              imageFiles[title] != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        imageFiles[title]!,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: blueColor,
                      radius: 24,
                      child: Icon(Icons.camera_alt, color: Colors.white),
                    ),
              SizedBox(height: 12),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                "Tap to upload or capture",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get hasImage =>
      imageFiles.values.any((file) => file != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Scan Mosquito"),
        backgroundColor: Colors.white, // <-- ubah jadi putih
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // icon back jadi hitam
        titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload images from different angles for better detection",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    buildImageBox("Right Side"),
                    SizedBox(height: 16),
                    buildImageBox("Left Side"),
                    SizedBox(height: 16),
                    buildImageBox("Top View"),
                    SizedBox(height: 16),
                    buildImageBox("Bottom View"),
                    SizedBox(height: 24),
                ElevatedButton.icon(
  onPressed: hasImage
      ? () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanResultPage(
                imageFiles: imageFiles,
              ),
            ),
          );
        }
      : null,
  icon: Icon(Icons.search),
  label: Text("Analyze"),
  style: ElevatedButton.styleFrom(
    backgroundColor: blueColor,
    minimumSize: Size(double.infinity, 48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
   SizedBox(height: 12),
                    Center(
                      child: Text(
                        "Upload at least one image to analyze the mosquito species",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}