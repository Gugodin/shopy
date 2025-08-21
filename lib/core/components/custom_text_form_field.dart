import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:replacenamehere/core/const/regex/regex.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool isRequired;
  final TextEditingController controller;

  const CustomTextFormField(
      {super.key,
      this.title,
      this.isRequired = true,
      this.hintText,
      this.inputFormatters,
      this.keyboardType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            '$title ${isRequired ? '*' : ''}',
          ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText ?? 'Write here',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return 'Requiered field';
            }

            if (keyboardType == TextInputType.emailAddress) {
              if (value != null && !RegExp(Regex.EMAIL).hasMatch(value)) {
                return 'Enter a valid email';
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
