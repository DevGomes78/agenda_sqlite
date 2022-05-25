import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  String? labelText;
  String? hintText;
  Widget? Icon;
  Widget? sulfixIcon;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  bool obscureText;
  ValueChanged<String>? onChanged;

  TextFormWidget(
      this.labelText,
      this.hintText,
      this.Icon,{
        this.sulfixIcon,
        this.validator,
        this.controller,
        this.obscureText = false,
        this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: Icon,
        suffixIcon: sulfixIcon,
      ),
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}