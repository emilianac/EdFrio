import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../styles/style.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  @override
  Widget build(BuildContext context) {
      final screenSize = MediaQuery.of(context).size;
      final screenWidth = screenSize.width;
      final screenHeight = screenSize.height;
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                height: screenHeight,
                constraints: const BoxConstraints(
                    minHeight: 560
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(shaderCallback: (bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [CustomColor.scaffoldBg, Colors.transparent],
                        ).createShader(bounds);
                      }, 
                      blendMode: BlendMode.srcATop,
                      child: Image.asset(
                          "assets/images/logo.png", 
                          width: screenWidth,
                      ),
                    ),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                      "Bem-vindo(a) à Edfrio Comércio e Locação LTDA \nSeu parceiro em refrigeração e ordenha de alta performance!", 
                                      style: kTitle
                                    ),
                                const SizedBox(
                                    height: 10
                                  ),
                                Text(
                                      "Somos especialistas em oferecer as melhores soluções em refrigeração de leite e ordenhadeiras para produtores rurais de pequeno e grande porte.\nCom venda, aluguel e manutenção de equipamentos, garantimos que sua produção seja sempre eficiente, segura e dentro dos mais altos padrões de qualidade.\nSeja para manter seu leite na temperatura ideal ou otimizar o processo de ordenha, conte com a nossa experiência e tecnologia para levar mais produtividade ao seu campo.", 
                                      style: kBody
                                    ),
                                const SizedBox(
                                    height: 10
                                  ),
                                Text(
                                      "Fale conosco e descubra como podemos ajudar você a produzir mais e melhor!", 
                                      style: kBody
                                    ),
                            ]
                          ),
                        ),
                        const SizedBox(
                          height: 20
                        ),
                        SizedBox(
                          width: 190,
                          child: ElevatedButton(
                          onPressed: () {}, 
                          style: kButton,
                          child: Text("Entre em contato", style: kNavItems),
                          ),
                        )
                  ],
                )
            ],
          ),
    );
  }
}