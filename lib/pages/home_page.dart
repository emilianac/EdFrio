import 'package:edfrio/constants/colors.dart';
import 'package:edfrio/widgets/footer_section.dart';
import 'package:edfrio/widgets/header_mobile.dart';
import 'package:edfrio/widgets/main_mobile.dart';
import 'package:flutter/material.dart';

import '../constants/size.dart';
import '../widgets/contact_section.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_desktop.dart';
import '../widgets/main_desktop.dart';
import '../widgets/products_desktop.dart';
import '../widgets/products_mobile.dart';
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
                SizedBox(height: 100,),

              //Services
              if(constraints.maxWidth > kMedDesktopWidth)
                const ServicesDesktop()
              else
                const ServicesMobile(),

            SizedBox(height: 200,),

            //Products
            if(constraints.maxWidth > kMedDesktopWidth)
              const ProductsDesktop()
            else
              const ProductsMobile(),

            SizedBox(height: 100,),
    
            //Contact
            ContactSection(),

            //Footer
            FooterSection(),
            ],
          ),
        );
      }
    );
  }
}