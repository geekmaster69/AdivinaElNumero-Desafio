




import 'package:flutter/material.dart';


class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingresa un numero',
        label: Text('Adivina el numero'),
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(16)
        )
      ),
    );
  }
}