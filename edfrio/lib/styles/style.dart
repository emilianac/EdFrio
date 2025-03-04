import 'package:flutter/material.dart';

import '../constants/colors.dart';

BoxDecoration kHeaderDecoration = BoxDecoration(
  gradient: const LinearGradient(
                colors: [
                    CustomColor.gradient1,
                    CustomColor.gradient2,
                    CustomColor.gradient3,
                    ],
                  ),
              borderRadius: BorderRadius.circular(100),
);

TextStyle kNavItems = TextStyle(
   fontSize: 16,
   fontWeight: FontWeight.w500,
   color: Colors.white,
);

TextStyle kTitle = TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.bold,
  color: CustomColor.primaryColor,
);

TextStyle kBody = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: CustomColor.textBody,
);