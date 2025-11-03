import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final int? maxLength; // 👈 add this
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final IconData? icon;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode; // 👈 New

  const AppTextField({
    super.key,

    required this.controller,
    this.maxLength,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.contentPadding,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      cursorColor: Colors.amber,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      style: const TextStyle(fontSize: 20, height: 1.0, color: Colors.grey),
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        if (widget.maxLength != null)
          LengthLimitingTextInputFormatter(widget.maxLength),
      ],
      onSubmitted: (_) {
        // 👇 Move focus to next field or close keyboard
        if (widget.nextFocusNode != null) {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.icon != null
            ? Icon(widget.icon, color: Colors.grey.shade400)
            : null,
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onLongPressStart: (_) {
                  setState(() {
                    _obscureText = false; // 👁️ Show password while holding
                  });
                },
                onLongPressEnd: (_) {
                  setState(() {
                    _obscureText = true; // 🙈 Hide password when released
                  });
                },
                child: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
              )
            : null,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.yellow, width: 2.0),
        ),
        fillColor: Colors.white70,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }
}
