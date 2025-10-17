import 'package:app_tesing/components/my_button.dart';
import 'package:app_tesing/components/my_textfield.dart';
import 'package:app_tesing/services/auth/auth_service.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  // register method
  void register() async {
    // get auth service
    final _authService = AuthService();

    // check if passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        await _authService.SignUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
        // final authService = AuthService();
        // await authService.signOut();
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("created successfully..."),
          ),
        );
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => LoginOrRegister(),
        //   ),
        // );
        // Navigator.pop(context);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomePage(),
        //   ),
        // );
        // Request focus on the email controller
        // emailFocusNode.requestFocus();
      }
      // display any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    // if passwords don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Passwords don't match!",
          ),
        ),
      );
    }
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
              "Let's create an Account for you",
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
            //Confirm Password textfield
            MyTextfield(
              controller: confirmPasswordController,
              hintText: 'Confirm PassWord',
              obscureText: true,
              icon: Icon(
                Icons.password,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //sign Up button
            MyButton(
              text: "Sign Up",
              onTap: register,
            ),
            SizedBox(
              height: 25,
            ),
            // already have an account login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
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
                    "Login now",
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
