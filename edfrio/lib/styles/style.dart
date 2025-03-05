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

BoxDecoration kServices = BoxDecoration(
  color: CustomColor.scaffoldBg,
  borderRadius: BorderRadius.circular(10),
);

BoxDecoration kServices2 = BoxDecoration(
  color: CustomColor.primaryColor,
  borderRadius: BorderRadius.circular(5.0),
);

BoxDecoration kAbout = BoxDecoration(
  color: CustomColor.scaffoldBg,
  borderRadius: BorderRadius.circular(5.0),
);

TextStyle kNavItems = TextStyle(
   fontSize: 16,
   fontWeight: FontWeight.w500,
   color: Colors.white,
);

TextStyle kLogo = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white54,
);

TextStyle kTitle = TextStyle(
  fontSize: 24,
  height: 1.5,
  fontWeight: FontWeight.bold,
  color: CustomColor.primaryColor,
);

TextStyle kBody = TextStyle(
  fontSize: 16,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: CustomColor.gradient1,
);

TextStyle kBody2 = TextStyle(
  fontSize: 16,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: CustomColor.secondaryColor,
);

ButtonStyle kButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(CustomColor.secondaryColor),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))
  ),
);

TextStyle kButtonText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white54,
);

TextStyle kServicesTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: CustomColor.primaryColor,
);

TextStyle kServicesTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w100,
  color: Colors.white,
);

TextStyle kAboutText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w200,
  color: Colors.black45,
);