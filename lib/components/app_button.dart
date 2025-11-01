/* 
 Button 

 a simple button. 

 -----------------------------
 
 To use this widget, you need;

 - text
 - a function ( on tap )
 */

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const AppButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // TODO: Add padding
        padding: const EdgeInsets.symmetric(vertical: 14),

        decoration: BoxDecoration(
          // TODO: Background color
          color: Theme.of(context).colorScheme.primary, // AppColors.primary,
          // TODO: Curved corners
          borderRadius: BorderRadius.circular(12),
        ),
        // Text in center
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
