import 'package:app_tesing/services/navigation_service.dart';
import 'package:flutter/material.dart';

void showDialogApp({
  required BuildContext context,
  String title = 'Successfully',
  String message = 'It is not yet created?.',
  String okText = 'OK',
  String cancelText = 'Cancel',
  VoidCallback? onOk,
  VoidCallback? onCancel,
  bool showCancelButton = false,
  Color backgroundColor = Colors.red,
  TextStyle? buttonTextStyle,
}) {
  // Helper function for buttons
  Widget _button({
    required VoidCallback? onPress,
    required String title,
    Color? background,
    TextStyle? textStyle,
  }) {
    return TextButton(
      onPressed: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: background ?? Colors.red,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          title,
          style: textStyle ?? const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Actually show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (showCancelButton)
            _button(
              onPress: onCancel ?? () => Navigator.of(context).pop(),
              title: cancelText,
              background: Colors.grey,
            ),
          _button(
            onPress: onOk ?? () => Navigator.of(context).pop(),
            title: okText,
            background: backgroundColor,
            textStyle: buttonTextStyle,
          ),
        ],
      );
    },
  );
}

// Updated snackBarApp
void snackBarApp({
  required String text,
  Color? colorBackground,
  int? seconds,
  IconData? icon,
  Color? textColor,
}) {
  final context = NavigationService.navigatorKey.currentContext;
  if (context == null) {
    print('No context available for snackbar');
    return;
  }

  final snackBar = SnackBar(
    backgroundColor: colorBackground ?? Colors.green,
    duration: Duration(seconds: seconds ?? 2),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        if (icon != null) ...[
          Icon(icon, color: textColor ?? Colors.white),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(text, style: TextStyle(color: textColor ?? Colors.white)),
        ),
      ],
    ),
  );

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}