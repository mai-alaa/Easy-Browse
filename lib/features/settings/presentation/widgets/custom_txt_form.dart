import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFeiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final void Function()? onTap;
  final String text;

  const CustomTextFormFeiled({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
    this.inputFormatter,
    this.keyboardType,
    this.onChanged,
    this.onSubmit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      inputFormatters: inputFormatter,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text, 
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF5F6F8),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.grey[600]),
    );
  }
}