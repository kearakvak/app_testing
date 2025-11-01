import 'package:app_tesing/Controller/data_handling_loca.dart';
import 'package:app_tesing/components/app_button.dart';
import 'package:app_tesing/components/app_text_field.dart';
import 'package:app_tesing/components/dialog/dialog_text.dart';
import 'package:app_tesing/components/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

final spaceBetween = const SizedBox(height: 24.0);
final spaceBetweenFielter = const SizedBox(height: 14.0);

class _EditProfilePageState extends State<EditProfilePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final cofirmPController = TextEditingController();
  final phoneController = TextEditingController();
  // final oTPController = List.generate(4, (_) => TextEditingController());
  // final oTPFocusNodes = List.generate(4, (_) => FocusNode());

  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPFocus = FocusNode();
  final phoneFocus = FocusNode();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    cofirmPController.dispose();
    phoneController.dispose();

    firstNameFocus.dispose();
    lastNameFocus.dispose();
    passwordFocus.dispose();
    confirmPFocus.dispose();
    phoneFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = Provider.of<DataHandlingLocal>(context);
    final data = local.registerData;
    return Scaffold(
      appBar: AppBar(),
      body:
          //  Center(
          //   child:
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child:
                // Scrollable form content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    Center(
                      child: ProfileImage(data: data, local: local),
                    ),
                    spaceBetween,
                    _name("First Name"),
                    AppTextField(
                      icon: Icons.person,
                      controller: firstNameController,
                      focusNode: firstNameFocus,
                      nextFocusNode: lastNameFocus,
                      textInputAction: TextInputAction.next,
                    ),
                    spaceBetweenFielter,
                    _name("Last Name"),
                    AppTextField(
                      icon: Icons.person,
                      controller: lastNameController,
                      focusNode: lastNameFocus,
                      nextFocusNode: phoneFocus,
                      textInputAction: TextInputAction.next,
                    ),
                    spaceBetweenFielter,
                    _name("Phone Number"),
                    AppTextField(
                      controller: phoneController,
                      icon: Icons.phone_locked_rounded,
                      focusNode: phoneFocus,
                      nextFocusNode: passwordFocus,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                    ),
                    spaceBetweenFielter,
                    _name("Date of birth"),
                    AppTextField(
                      icon: Icons.lock_outline_rounded,
                      controller: passwordController,
                      obscureText: true,
                      focusNode: passwordFocus,
                      nextFocusNode: confirmPFocus,
                      textInputAction: TextInputAction.next,
                    ),
                    spaceBetweenFielter,
                    _name("Confirm Password"),
                    AppTextField(
                      icon: Icons.lock_outline_rounded,
                      controller: cofirmPController,
                      obscureText: true,
                      focusNode: confirmPFocus,
                      textInputAction: TextInputAction.done,
                    ),
                    // Extra space to ensure content doesn't hide behind fixed button
                  ],
                ),
          ),

      // ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: AppButton(text: "Save", onTap: _validateAndSave),
        ),
      ],
    );
  }

  // Extract the validation logic to a separate method for cleaner code
  void _validateAndSave() {
    if (firstNameController.text.isEmpty) {
      firstNameFocus.requestFocus();
    } else if (lastNameController.text.isEmpty) {
      lastNameFocus.requestFocus();
    } else if (phoneController.text.isEmpty) {
      phoneFocus.requestFocus();
    } else if (passwordController.text.isEmpty) {
      passwordFocus.requestFocus();
    } else if (cofirmPController.text.isEmpty) {
      confirmPFocus.requestFocus();
    } else if (passwordController.text != cofirmPController.text) {
      snackBarApp(
        text: "Passwords do not match",
        colorBackground: Colors.amber, // AppColors.natural400,
        textColor: Colors.white, // AppColors.natural0,
      );
      return;
    } else {
      String phone = phoneController.text.replaceFirst(RegExp(r'^0+'), '');
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => GetOTPPage()),
      // );
    }
  }

  Widget _name(String title) {
    return Text(title);
    //  AppText(title, type: AppTextType.body);
  }
}
