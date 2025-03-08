import 'package:flutter/material.dart';
import '../constants/nav_items.dart';
import '../styles/style.dart';
import 'site_logo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key});

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 60,
            margin: const EdgeInsets.symmetric(
                vertical: 10, 
                horizontal: 20,
              ),
            width: double.maxFinite,
            decoration: kHeaderDecoration,
            child: Row(
              children: [
                SiteLogo(onTap: () {

                },),
              const  Spacer(),
                for(int i = 0; i<navTitles.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(onPressed: (){
            
                  }, 
                  child: Text(navTitles[i], style: kNavItemsText,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}