import 'package:app_tesing/Controller/data_handling_loca.dart';
import 'package:app_tesing/components/profile_image.dart';
import 'package:app_tesing/models/profile.dart';
import 'package:app_tesing/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile? _profile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final profile = await FirestoreService().getCurrentUserProfile();
      setState(() {
        _profile = profile;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading profile: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_profile == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
        body: Center(child: Text('No profile found')),
      );
    }
    // ✅ Declare variables before the widget tree
    final image = context.watch<DataHandlingLocal>().profileData?.image;
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileImage(image: image),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Full Name'),
              subtitle: Text(_profile!.fullName ?? '-'),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle: Text(_profile!.phone ?? '-'),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text('Birth Date'),
              subtitle: Text(_profile!.birthDate ?? '-'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
