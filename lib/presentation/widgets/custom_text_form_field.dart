import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final Function(String value) onSubmit;
  const CustomTextFormField(
      {super.key, this.label, this.hintText, required this.onSubmit});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (value) {
        controller.clear();
        widget.onSubmit(value);
      },
      decoration: InputDecoration(
          hintText: widget.hintText,
          label: (widget.label != null) ? Text(widget.label!) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
