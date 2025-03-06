import 'package:edfrio/constants/colors.dart';
import 'package:flutter/material.dart';

import '../styles/style.dart';

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({super.key});

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  get kInput => null;

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: [
        Flexible(
          child: TextField(
            style: kInputText,
            decoration: kInput,

          ),
        ),


      ],
    );
    
  }
}