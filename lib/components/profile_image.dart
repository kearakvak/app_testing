import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.image, this.onTap, this.isEdit});
  final bool? isEdit;
  final File? image;
  // final DataRegister? data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: ClipOval(
            child: image != null
                ? Image.file(
                    image!,
                    // width: 100,
                    // height: 100,
                    fit: BoxFit.cover, // fill the circle
                  )
                : Icon(Icons.person, size: 60), // smaller icon to fit circle
          ),
        ),
        if (isEdit ?? false)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
              ),

              // padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: onTap,
                icon: Icon(Icons.mode_edit_outlined, size: 16),
              ),
            ),
          ),
      ],
    );
  }
}
