import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../styles/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
      super.key, 
      this.controller,
      this.maxLines=1,
      this.hintText,
  });
      final TextEditingController? controller;
      final int maxLines;
      final String? hintText;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: kHintStyle,
      decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: CustomColor.primaryColor.withOpacity(0.10),
              focusedBorder: getInputBorder,
              enabledBorder: getInputBorder,
              border: getInputBorder,
              hintText: hintText,
              hintStyle: kHintStyle,
        ),

    );
  }
  OutlineInputBorder get getInputBorder{
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      );
    }
}
