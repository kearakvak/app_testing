import 'package:app_tesing/Controller/data_handling_loca.dart';
import 'package:app_tesing/components/my_drawer_tile.dart';
import 'package:app_tesing/components/profile_image.dart';
import 'package:app_tesing/models/data_register.dart';
import 'package:app_tesing/models/profile.dart';
import 'package:app_tesing/pages/edit_profile_page.dart';
import 'package:app_tesing/pages/profile_page.dart';
import 'package:app_tesing/pages/settings_page.dart';
import 'package:app_tesing/services/auth/auth_service.dart';
import 'package:app_tesing/services/auth/login_or_register.dart';
import 'package:app_tesing/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? email; // single profile

  @override
  void initState() {
    super.initState();
    _loadProfile(); // call async function
  }

  // Async method to fetch profile
  Future<void> _loadProfile() async {
    final authService = AuthService();
    final profileService = FirestoreService();
    final data = context.read<DataHandlingLocal>();

    try {
      // Fetch current user's email
      final userEmail = authService.getCurrentUserEmail();

      // Fetch profile from Firestore
      final profile = await profileService.getProfile();

      if (profile != null) {
        // Add email if it’s missing
        profile.email ??= userEmail;

        // ✅ Update provider safely
        data.updateProfile(profile);
      } else {
        // ✅ Create new empty profile if none exists
        data.update(email: userEmail);
      }
    } catch (e) {
      debugPrint("❌ Failed to load profile: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = context.watch<DataHandlingLocal>().profileData?.image;
    final data = context.watch<DataHandlingLocal>();
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            ProfileImage(image: image),
            SizedBox(height: 8),
            Text(
              "${data.profileData?.email ?? 'Loading...'}",
              style: TextStyle(fontSize: 24, color: Colors.grey.shade600),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Divider(color: Theme.of(context).colorScheme.secondary),
            ),
            MyDrawerTile(
              text: "Frofile",
              icon: Icons.person,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            MyDrawerTile(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),
            MyDrawerTile(
              text: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            MyDrawerTile(
              text: "Update Profile",
              icon: Icons.person,
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            Spacer(),
            MyDrawerTile(
              text: "L O G O U T",
              icon: Icons.logout,
              onTap: () async {
                final authService = AuthService();
                await authService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginOrRegister()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
