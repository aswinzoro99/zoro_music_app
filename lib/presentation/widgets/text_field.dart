import 'package:advanced_flutter_projexct/core/base_screen.dart';
import 'package:flutter/material.dart';

class CustomTextField extends BaseScreen {
  final TextEditingController? controller;
  final TextInputType? type;
  final bool? obscureText;
  final String? hintText;
  final Widget? suffixIcon;

  const CustomTextField({
    this.controller,
    this.type,
    this.obscureText = false,
    this.hintText,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends BaseState<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.type,
      autocorrect: false,
      enableInteractiveSelection: true,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        isDense: true,
        hintText: widget.hintText,
        suffix: widget.suffixIcon,
      ),
    );
  }
}
