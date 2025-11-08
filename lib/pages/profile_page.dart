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
  String? _errorMessage;

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
        _errorMessage = null;
      });
    } catch (e) {
      print('Error loading profile: $e');
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load profile. Please try again.';
      });
    }
  }

  Future<void> _refreshProfile() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    await _loadProfile();
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        // Profile image section
        Consumer<DataHandlingLocal>(
          builder: (context, dataHandler, child) {
            final image = dataHandler.profileData?.image;
            return ProfileImage(image: image);
          },
        ),

        const SizedBox(height: 20),

        // Profile details
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: const Text(
                  'Full Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_profile!.fullName ?? 'Not provided'),
                trailing: const Icon(Icons.edit, color: Colors.grey),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text(
                  'Phone',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_profile!.phone ?? 'Not provided'),
                trailing: const Icon(Icons.edit, color: Colors.grey),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.cake, color: Colors.orange),
                title: const Text(
                  'Birth Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_profile!.birthDate ?? 'Not provided'),
                trailing: const Icon(Icons.edit, color: Colors.grey),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Additional profile information can be added here
        // Email, bio, address, etc.
      ],
    );
  }

  Widget _buildErrorState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 64, color: Colors.red),
        const SizedBox(height: 16),
        Text(
          _errorMessage ?? 'An error occurred',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: _refreshProfile,
          icon: const Icon(Icons.refresh),
          label: const Text('Try Again'),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.person_outline, size: 64, color: Colors.grey),
        const SizedBox(height: 16),
        const Text(
          'No profile found',
          style: TextStyle(fontSize: 18, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        const Text(
          'Please complete your profile setup',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: _refreshProfile,
          icon: const Icon(Icons.refresh),
          label: const Text('Refresh'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshProfile,
            tooltip: 'Refresh Profile',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshProfile,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (_errorMessage != null) _buildErrorState(),
                    if (_errorMessage == null && _profile == null)
                      _buildEmptyState(),
                    if (_errorMessage == null && _profile != null)
                      _buildProfileInfo(),
                  ],
                ),
              ),
            ),
    );
  }
}
