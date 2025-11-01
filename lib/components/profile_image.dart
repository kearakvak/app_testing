import 'dart:io';

import 'package:app_tesing/Controller/data_handling_loca.dart';
import 'package:app_tesing/components/image_helper.dart';
import 'package:app_tesing/models/data_register.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.data, required this.local});

  final DataRegister? data;
  final DataHandlingLocal local;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red, // AppColors.natural300.withOpacity(0.3),
            border: Border.all(
              color: Colors.red, // AppColors.natural300,
              width: 2,
            ),
          ),
          child: ClipOval(
            child: data?.image != null
                ? Image.file(
                    data!.image!,
                    // width: 100,
                    // height: 100,
                    fit: BoxFit.cover, // fill the circle
                  )
                : Icon(Icons.person, size: 60), // smaller icon to fit circle
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red, //AppColors.natural200.withOpacity(0.7),
            ),

            // padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () async {
                final imageHelper = ImageHelper(); // ✅ create instance first
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
                    local.updateImage(File(croppedFile.path));
                  }
                }
              },
              icon: Icon(Icons.mode_edit_outlined, size: 16),
            ),
          ),
        ),
      ],
    );
  }
}
