import 'package:edfrio/constants/colors.dart';
import 'package:edfrio/widgets/header_mobile.dart';
import 'package:edfrio/widgets/main_mobile.dart';
import 'package:flutter/material.dart';

import '../constants/size.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_desktop.dart';
import '../widgets/main_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer:constraints.maxWidth > kMinDesktopWidth?null: const DrawerMobile(), 
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //Main
              if(constraints.maxWidth > kMinDesktopWidth)
                const HeaderDesktop() 
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              
              if(constraints.maxWidth > kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

               //Info
              Container(
                height: 500,
                width: double.maxFinite,
                color: Color(0xFF1E3D6D),
              ),
        
               //Products
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
        
               //Contact
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
        
              //Footer
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
            ],
          ),
        );
      }
    );
  }
}