import 'dart:io';

import 'package:app_tesing/Controller/data_handling_loca.dart';
import 'package:app_tesing/components/app_button.dart';
import 'package:app_tesing/components/app_text_field.dart';
import 'package:app_tesing/components/app_text_field_date.dart';
import 'package:app_tesing/components/dialog/dialog_text.dart';
import 'package:app_tesing/components/image_helper.dart';
import 'package:app_tesing/components/profile_image.dart';
import 'package:app_tesing/models/profile.dart';
import 'package:app_tesing/services/database/firestore.dart';
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
  final FirestoreService service = FirestoreService(); // non-nullable

  File? image;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  // final passwordController = TextEditingController();
  final dateController = TextEditingController();
  // final cofirmPController = TextEditingController();
  final phoneController = TextEditingController();
  // final oTPController = List.generate(4, (_) => TextEditingController());
  // final oTPFocusNodes = List.generate(4, (_) => FocusNode());

  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  // final passwordFocus = FocusNode();
  final dateFocus = FocusNode();
  // final confirmPFocus = FocusNode();
  final phoneFocus = FocusNode();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    // passwordController.dispose();
    dateController.dispose();
    // cofirmPController.dispose();
    phoneController.dispose();

    firstNameFocus.dispose();
    lastNameFocus.dispose();
    // passwordFocus.dispose();
    // confirmPFocus.dispose();
    dateFocus.dispose();
    phoneFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = Provider.of<DataHandlingLocal>(context);
    // final data = local.registerData;
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
                      child: ProfileImage(
                        isEdit: true,
                        image: image ?? local.profileData?.image,
                        onTap: () async {
                          final imageHelper =
                              ImageHelper(); // ✅ create instance first
                          final files = await imageHelper
                              .pickImage(); // ✅ use instance method
                          if (files.isNotEmpty) {
                            final croppedFile = await imageHelper.crop(
                              file: files.first,
                              // circleCrop: true, // optional
                            );
                            if (croppedFile != null) {
                              // data?.image = File(
                              //   croppedFile.path,
                              // ); // ✅ update provider
                              // ✅ Use provider’s method instead of direct mutation
                              setState(() {
                                image = File(croppedFile.path);
                              });

                              // local.updateImage(File(croppedFile.path));
                            }
                          }
                        },
                      ),
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
                      hintText: "_ _ _ _ _ _ _ _ _ _",
                      maxLength: 10,
                      controller: phoneController,
                      icon: Icons.phone_locked_rounded,
                      focusNode: phoneFocus,
                      nextFocusNode: dateFocus,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                    ),
                    spaceBetweenFielter,
                    _name("Date of birth"),
                    AppTextFieldDate(
                      icon: Icons.date_range_outlined,
                      controller: dateController,
                      focusNode: dateFocus,
                      // nextFocusNode: phoneFocus,
                      textInputAction: TextInputAction.done,
                    ),
                    // AppTextField(
                    //   icon: Icons.lock_outline_rounded,
                    //   controller: passwordController,
                    //   obscureText: true,
                    //   focusNode: passwordFocus,
                    //   nextFocusNode: confirmPFocus,
                    //   textInputAction: TextInputAction.next,
                    // ),
                    // spaceBetweenFielter,
                    // _name("Confirm Password"),
                    // AppTextField(
                    //   icon: Icons.lock_outline_rounded,
                    //   controller: cofirmPController,
                    //   obscureText: true,
                    //   focusNode: confirmPFocus,
                    //   textInputAction: TextInputAction.done,
                    // ),
                    // Extra space to ensure content doesn't hide behind fixed button
                  ],
                ),
          ),

      // ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: AppButton(
            text: "Save",
            onTap: () async {
              Profile? dataProfile = Profile(); // create a new instance

              if (firstNameController.text.isEmpty) {
                firstNameFocus.requestFocus();
                return;
              } else if (lastNameController.text.isEmpty) {
                lastNameFocus.requestFocus();
                return;
              } else if (phoneController.text.isEmpty) {
                phoneFocus.requestFocus();
                return;
              } else if (dateController.text.isEmpty) {
                dateFocus.requestFocus();
                return;
              } else {
                String phone = phoneController.text.replaceFirst(
                  RegExp(r'^0+'),
                  '',
                );
                snackBarApp(
                  text: "Successfully updated profile",
                  colorBackground: Colors.grey,
                );

                // if (image != null) {
                dataProfile.birthDate = dateController.text;
                dataProfile.fullName =
                    '${lastNameController.text} ${firstNameController.text}';
                dataProfile.phone = phoneController.text;
                // dataProfile.imageUrl = await updateProfileImage();

                // Update provider
                context.read<DataHandlingLocal>().update(image: image);
                dataProfile.imageUrl = await service.uploadFileToFirebase(
                  image,
                );

                // Save to Firestore safely
                if (dataProfile != null) {
                  // showDialog(
                  //   context: context,
                  //   builder: (context) =>
                  //       AlertDialog(title: Text("it Sccessfluly")),
                  // );
                  await service.saveOrUpdateProfile(dataProfile);
                  // Navigator.pop(context);
                }
              }

              Navigator.pop(context);
              // }
            },
          ),
        ),
      ],
    );
  }

  // Extract the validation logic to a separate method for cleaner code
  // Future<void> _validateAndSave() async {
  //   if (firstNameController.text.isEmpty) {
  //     firstNameFocus.requestFocus();
  //   } else if (lastNameController.text.isEmpty) {
  //     lastNameFocus.requestFocus();
  //   } else if (phoneController.text.isEmpty) {
  //     phoneFocus.requestFocus();
  //   } else if (dateController.text.isEmpty) {
  //     dateFocus.requestFocus();
  //   } else {
  //     String phone = phoneController.text.replaceFirst(RegExp(r'^0+'), '');
  //     snackBarApp(
  //       text: "Successfully updated profile",
  //       colorBackground: Colors.grey,
  //     );

  //     // if (image != null) {
  //     dataProfile?.birthDate = dateController.text.toString();
  //     dataProfile?.fullName =
  //         '${lastNameController.text} ${firstNameController.text}';
  //     dataProfile?.phone = phoneController.text.toString();

  //     // Update provider

  //     dataProfile?.imageUrl = await updateProfileImage();

  //     // Save to Firestore safely
  //     if (dataProfile != null) {
  //       await service.saveProfile(dataProfile!);
  //     }
  //   }

  //   Navigator.pop(context);
  //   // }
  // }

  Widget _name(String title) {
    return Text(title, style: TextStyle(fontSize: 12));
    // return AppText(title, type: AppTextType.body);
  }

  // Future<String?> updateProfileImage() async {
  //   final service = FirestoreService();

  //   // upload image and wait for download URL
  //   String? imageUrl = await service.uploadFileToFirebase(image);

  //   // optionally update your local state
  //   // context.read<DataHandlingLocal>().update(imageUrl: imageUrl);

  //   return imageUrl; // returns Future<String?>
  // }
}
