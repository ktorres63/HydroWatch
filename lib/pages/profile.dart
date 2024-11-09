// lib/features/home/profile.dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "John Doe";
  String userEmail = "johndoe@example.com";
  String userPhone = "+1 234 567 890";
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture and Edit Button
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? Icon(Icons.person, size: 50, color: Colors.grey)
                    : null,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Tap to change profile picture',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
            SizedBox(height: 20),

            // User Info Cards
            _buildInfoCard(Icons.person, 'Name', userName),
            _buildInfoCard(Icons.email, 'Email', userEmail),
            _buildInfoCard(Icons.phone, 'Phone', userPhone),

            // Edit Profile Button
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // Add logic to edit profile information here
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Edit profile functionality coming soon!'),
                ));
              },
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build each information card
  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
