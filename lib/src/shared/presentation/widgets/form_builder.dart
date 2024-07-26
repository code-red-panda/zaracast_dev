import 'package:flutter/material.dart';

class FormBuilder extends StatelessWidget {
  const FormBuilder({
    required this.formKey,
    required this.mainAxisAlignment,
    required this.children,
    this.canPop,
    this.onPopInvoked,
    this.onChanged,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;
  final bool? canPop;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool)? onPopInvoked;
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      canPop: canPop,
      onPopInvoked: onPopInvoked,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      ),
    );
  }
}
