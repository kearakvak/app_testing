import 'package:app_tesing/components/select_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldDate extends StatefulWidget {
  final int? maxLength;
  final TextEditingController controller;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final IconData? icon;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  const AppTextFieldDate({
    super.key,
    required this.controller,
    this.maxLength,
    this.hintText,
    this.icon,
    this.contentPadding,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  State<AppTextFieldDate> createState() => _AppTextFieldDateState();
}

class _AppTextFieldDateState extends State<AppTextFieldDate> {
  Future<void> _pickDate() async {
    final String? data = await SelectDate.show(context);

    if (data != null && data.isNotEmpty) {
      widget.controller.text = data;
      debugPrint('Selected date: $data');

      // 👇 Move to next field automatically
      if (widget.nextFocusNode != null) {
        FocusScope.of(context).requestFocus(widget.nextFocusNode);
      } else {
        FocusScope.of(context).unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      readOnly: true, // 👈 prevents typing
      showCursor: false, // 👈 hide blinking cursor
      cursorColor: Colors.amber, // AppColors.primary,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      style: const TextStyle(
        fontSize: 20,
        height: 1.0,
        color: Colors.white, // AppColors.natural600,
      ),
      onTap: _pickDate, // 👈 opens date picker
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        if (widget.maxLength != null)
          LengthLimitingTextInputFormatter(widget.maxLength),
      ],
      decoration: InputDecoration(
        hintText: widget.hintText ?? "Select date",
        prefixIcon: widget.icon != null
            ? Icon(widget.icon, color: Colors.grey.shade400)
            : null,
        suffixIcon: GestureDetector(
          onTap: _pickDate,
          child: const Icon(
            Icons.date_range_outlined,
            color: Colors.grey, // AppColors.natural400,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.yellow, // AppColors.primary
            width: 2.0,
          ),
        ),
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        fillColor: Colors.blueGrey, // AppColors.background,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }
}
