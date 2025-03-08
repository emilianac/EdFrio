import 'package:flutter/material.dart';

import '../constants/colors.dart';

//Main
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

TextStyle kLogo = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white54,
);

TextStyle kTitle = TextStyle(
  fontSize: 24,
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

//Services
BoxDecoration kServices = BoxDecoration(
  color: CustomColor.scaffoldBg,
  borderRadius: BorderRadius.circular(10),
);

BoxDecoration kServices2 = BoxDecoration(
  color: CustomColor.primaryColor,
  borderRadius: BorderRadius.circular(5.0),
);

TextStyle kServicesTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: CustomColor.secondaryColor,
);

TextStyle kServicesTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w100,
  color: Colors.white,
);

//About
BoxDecoration kAbout = BoxDecoration(
  color: Colors.white54,
  borderRadius: BorderRadius.circular(5.0),
);

TextStyle kAboutText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
  color: CustomColor.primaryColor,
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

//Products
BoxDecoration kProducts = BoxDecoration(
  color: CustomColor.primaryColor.withOpacity(0.10),
  borderRadius: BorderRadius.circular(5.0),
);

TextStyle kProductsTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: CustomColor.secondaryColor,
);

TextStyle kProductsTitle2 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: CustomColor.primaryColor,
);

TextStyle kProductsText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w200,
  color: CustomColor.primaryColor,
);

TextStyle kProductsText2 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: CustomColor.primaryColor,
);

//Text Field
BoxDecoration kBoxContact = BoxDecoration(
  color: CustomColor.primaryColor.withOpacity(0.20),
  borderRadius: BorderRadius.circular(10),
);

TextStyle kInputText = TextStyle(
  color: CustomColor.scaffoldBg,
);

TextStyle kHintStyle = TextStyle(
  color: Colors.white38,
);
