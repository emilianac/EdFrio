import 'package:flutter/material.dart';

import '../constants/colors.dart';

//Box Decoration
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

BoxDecoration kFooderDecoration = BoxDecoration(
  gradient: const LinearGradient(
                colors: [
                    CustomColor.gradient1,
                    CustomColor.gradient2,
                    CustomColor.gradient3,
                    CustomColor.gradient1,
                    ],
                  ),
);

BoxDecoration kServicesDecoration = BoxDecoration(
  color: CustomColor.primaryColor,
  borderRadius: BorderRadius.circular(5.0),
);

BoxDecoration kServices = BoxDecoration(
  color: CustomColor.scaffoldBg,
  borderRadius: BorderRadius.circular(10),
);

BoxDecoration kProducts = BoxDecoration(
  color: CustomColor.primaryColor.withOpacity(0.10),
  borderRadius: BorderRadius.circular(5.0),
);

//Text Style
TextStyle kNavItemsText = TextStyle(
   fontSize: 16,
   fontWeight: FontWeight.w500,
   color: Colors.white,
);

TextStyle kFooterText = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w100,
  color: Colors.white54,
);

TextStyle kFooterSignature = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w100,
  color: Colors.white54,
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

TextStyle kTitleServices = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle kTitleProducts = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: CustomColor.secondaryColor,
);

TextStyle kBody = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
  color: CustomColor.primaryColor,
);

TextStyle kBodyProducts = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

TextStyle kButtonText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle kHintStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: CustomColor.primaryColor,
);

//Button Style
ButtonStyle kButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(CustomColor.secondaryColor),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))
  ),
);