import 'package:app_tesing/components/my_button.dart';
import 'package:app_tesing/components/my_textfield.dart';
import 'package:app_tesing/pages/home_page.dart';
import 'package:app_tesing/services/auth/auth_service.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() async {
    // get instance of auth service
    final _authService = AuthService();

    //try sign in
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      await _authService.SignInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );

      // pop the loding circle
      //  Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      emailController.clear();
      passwordController.clear();
    }

    // display any errors
    catch (e) {
      // pop the loding circle
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }

    // pop the loding circle
    ///  Navigator.pop(context);
  }

  // forgot password
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("User tapped forgot password."),
      ),
    );
    // pop the loding circle
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: 25,
            ),
            //message,app slogan
            Text(
              "Food Delivery App",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(
              height: 25,
            ),
            //email textfield
            MyTextfield(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              icon: Icon(
                Icons.email,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //password textfield
            MyTextfield(
              controller: passwordController,
              hintText: 'PassWord',
              obscureText: true,
              icon: Icon(
                Icons.password,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //sign it button
            MyButton(
              text: "Login",
              onTap: login,
            ),
            SizedBox(
              height: 25,
            ),
            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
