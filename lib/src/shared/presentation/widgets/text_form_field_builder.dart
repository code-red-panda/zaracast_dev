import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldBuilder extends StatelessWidget {
  const TextFormFieldBuilder({
    required super.key,
    this.autocorrect = true,
    this.autofillHints,
    this.autofocus = false,
    this.contentPadding,
    this.controller,
    this.counterText,
    this.focusNode,
    this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.maxLines,
    this.maxLength,
    this.obscureText = false,
    this.onEditingComplete,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.textStyle,
    this.validator,
  });

  final bool autocorrect;
  final List<String>? autofillHints;
  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final String? counterText;
  final FocusNode? focusNode;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? maxLength;
  final int? maxLines;
  final bool obscureText;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      autocorrect: autocorrect,
      autofillHints: autofillHints,
      autofocus: autofocus,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        counterText: counterText,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge ?? const TextStyle(),
        labelText: labelText,
        prefix: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      obscureText: obscureText,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      style: textStyle,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      validator: validator,
    );
  }
}
