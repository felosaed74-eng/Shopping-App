import 'package:flutter/material.dart';

class CoustomTextFormFeild extends StatelessWidget {
  const CoustomTextFormFeild({
    super.key,
    this.controller,
    this.validator,
    this.maxLines = 1,
    required this.label,
    required this.hint,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String label;
  final String hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}
