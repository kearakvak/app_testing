import 'package:app_tesing/components/navigator_state_ser.dart';
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
  Color backgroundColor = Colors.red, // AppColors.primary,
  TextStyle? buttonTextStyle,
}) {
  // 👇 define the helper FIRST before using it
  Widget _button({
    void Function()? onPress,
    String? title,
    Color? background,
    TextStyle? textStyle,
  }) {
    return TextButton(
      onPressed: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: background ?? Colors.red, // AppColors.primary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          title ?? "",
          // type: AppTextType.body,
          style: textStyle ?? const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void snackBarApp({
  required String text,
  Color? colorBackground,
  int? seconds,
  IconData? icon,
  Color? textColor,
}) {
  final context = NavigatorStateSer.maybeContext;
  if (context == null) return;

  final snackBar = SnackBar(
    backgroundColor: colorBackground ?? Colors.red,
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
