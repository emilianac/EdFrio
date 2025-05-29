import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/nav_items.dart';

class DrawerMobile extends StatefulWidget {
  const DrawerMobile({super.key});

  @override
  State<DrawerMobile> createState() => _DrawerMobileState();
}

class _DrawerMobileState extends State<DrawerMobile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: CustomColor.primaryColor,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: IconButton(onPressed: () {
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.close, color: Colors.white)),
              ),
            ),
            for(int i = 0; i<navIcons.length; i++)
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 30
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              onTap: () {
                
              },
              leading: Icon(navIcons[i], color: Colors.white),
              title: Text(navTitles[i], style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
  }
}