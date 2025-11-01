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

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      title: Text(
        title,
        // type: AppTextType.headline,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red, // AppColors.natural500
        ),
      ),
      content: Text(
        message,
        // type: AppTextType.body,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          //  AppColors.natural400
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        if (showCancelButton)
          _button(
            title: cancelText,
            background: Colors.red, // AppColors.natural200,
            textStyle: const TextStyle(color: Colors.black87),
            onPress: () {
              Navigator.of(context).pop();
              if (onCancel != null) onCancel();
            },
          ),
        _button(
          title: okText,
          background: backgroundColor,
          onPress: () {
            Navigator.of(context).pop();
            if (onOk != null) onOk();
          },
          textStyle: buttonTextStyle,
        ),
      ],
    ),
  );
}

// 🔹 Dialog helpers
void showNoDataDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("No Data"),
      content: const Text("No tours found for this request."),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}

// Helper method to show error dialog
void showErrorDialog(BuildContext context, Exception error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Error'),
      content: Text('Failed to load data: ${error.toString()}'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
      ],
    ),
  );
}

void snackBarApp({
  required String text,
  Color? colorBackground,
  int? seconds,
  IconData? icon,
  Color? textColor,
}) async {
  // handle action
  // final text = 'Important Message';
  // final snackBar = SnackBar(content: Text(text));
  final context = NavigatorStateSer.context();

  final snackBar = SnackBar(
    backgroundColor: colorBackground ?? Colors.red, // AppColors.error500,
    duration: Duration(seconds: seconds ?? 1),
    behavior: SnackBarBehavior.floating,
    // margin: const EdgeInsets.all(24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    content: GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: (icon == null)
          ? Text(
              text,
              // type: AppTextType.body,
              style: TextStyle(color: textColor),
            )
          : Row(
              children: [
                Icon(
                  icon,
                  color: Colors.red, // AppColors.natural0
                ),
                const SizedBox(width: 12),
                Text(
                  text,
                  // type: AppTextType.body,
                  style: TextStyle(
                    color: textColor ?? Colors.red, // AppColors.natural0
                  ),
                ),
              ],
            ),
    ),
  );

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
