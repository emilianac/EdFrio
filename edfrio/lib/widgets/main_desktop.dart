import 'package:flutter/material.dart';

import '../styles/style.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
                constraints: const BoxConstraints(
                    minHeight: 350
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                        "assets/images/logo.png", 
                        width: screenWidth / 2
                      ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth / 2,
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
                          width: 250,
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