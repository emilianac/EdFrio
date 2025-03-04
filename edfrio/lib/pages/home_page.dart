import 'package:edfrio/constants/colors.dart';
import 'package:edfrio/widgets/header_mobile.dart';
import 'package:flutter/material.dart';

import '../constants/size.dart';
import '../styles/style.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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

              Container(
                constraints: const BoxConstraints(minHeight: 350),
                child: Row(
                  children: [
                    Image.asset("assets/images/logo.png", width: screenWidth / 2),
                    Column(
                      children: [
                        SizedBox(
                          width: screenWidth / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Bem-vindo(a) à Edfrio Comércio e Locação LTDA \nSua parceira em refrigeração e ordenha de alta performance!", style: kTitle),
                              Text("Somos especialistas em oferecer as melhores soluções em refrigeração de leite e ordenhadeiras para produtores rurais de pequeno e grande porte. \n Com venda, aluguel e manutenção de equipamentos, garantimos que sua produção seja sempre eficiente, segura e dentro dos mais altos padrões de qualidade. \n Seja para manter seu leite na temperatura ideal ou otimizar o processo de ordenha, conte com a nossa experiência e tecnologia para levar mais produtividade ao seu campo. \n Fale conosco e descubra como podemos ajudar você a produzir mais e melhor!", style: kBody),
                            ],
                          ),
                        ),
                        ElevatedButton(onPressed: () {}, child: const Text("Entre em contato")),
                  
                      ],
                    )
                  ],
                ),
                ),
        
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