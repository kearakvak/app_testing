import 'package:app_tesing/components/my_drawer_tile.dart';
import 'package:app_tesing/pages/settings_page.dart';
import 'package:app_tesing/services/auth/auth_service.dart';
import 'package:app_tesing/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // void logout() {
    //   final authService = AuthService();
    //   authService.signOut();
    //   // pop the loding circle
    //   //   Navigator.pop(context);
    //   // Navigator.push(
    //   //   context,
    //   //   MaterialPageRoute(
    //   //     builder: (context) => LoginOrRegister(),
    //   //   ),
    //   // );
    // }
    Future<void> logout() async {
      final authService = AuthService();
      await authService.signOut();
      // Navigate to the login or registration page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginOrRegister()),
      );
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(Icons.lock_open_rounded, size: 80),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),

          // home list tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // settings list tile
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

          Spacer(),
          // logout list tile
          MyDrawerTile(text: "L O G O U T", icon: Icons.logout, onTap: logout),
        ],
      ),
    );
  }
}
