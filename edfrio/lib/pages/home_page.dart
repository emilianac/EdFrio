import 'package:edfrio/constants/colors.dart';
import 'package:edfrio/widgets/header_mobile.dart';
import 'package:edfrio/widgets/main_mobile.dart';
import 'package:flutter/material.dart';

import '../constants/size.dart';
import '../styles/style.dart';
import '../widgets/about_desktop.dart';
import '../widgets/about_mobile.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_desktop.dart';
import '../widgets/main_desktop.dart';
import '../widgets/services_desktop.dart';
import '../widgets/services_mobile.dart';

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


              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                decoration: kServices2,
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                      Text(
                          "O que é EdFrio Comércio e Locação?",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CustomColor.secondaryColor),
                        ),
                        const AboutDesktop()
                    ],
                  ),
                ),


              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                decoration: kServices2,
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                      Text(
                          "Nossos serviços:",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),

                      if(constraints.maxWidth > kMedDesktopWidth)
                        const ServicesDesktop()
                      else
                        const ServicesMobile(),
                    ],
                  ),
                ),


                Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                decoration: kServices2,
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                      Text(
                          "Alguns dos nossos produtos:",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),

                      //if(constraints.maxWidth > kMedDesktopWidth)
                        //const ServicesDesktop()
                      //else
                        //const ServicesMobile(),
                    ],
                  ),
                ),


              ],
            ),
          );
        }
      );
    }
}