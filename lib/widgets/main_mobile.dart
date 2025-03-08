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
      final screenSize = MediaQuery.of(context).size * 0.9;
      final screenWidth = screenSize.width;
      final screenHeight = screenSize.height;
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                height: screenHeight,
                child: SingleChildScrollView(
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
                              _textTopic(screenWidth),

                              const SizedBox(
                                  height: 10
                              ),

                              SizedBox(
                                width: 250,
                                child: ElevatedButton(
                                onPressed: () {

                                }, 
                                style: kButton,
                                child: Text(
                                  "Entre em contato", 
                                  style: kButtonText
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
          ),
      ),
    );
  }

Widget _textTopic(double screenWidth) {
  return SizedBox(
   width: double.maxFinite,
   child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Text(
                        "Bem-vindo(a) à Edfrio Comércio e Locação LTDA\nSeu parceiro em refrigeração e ordenha de alta performance!", 
                        style: kTitle,
                        textAlign: TextAlign.justify,
                      ),

                    const SizedBox(
                        height: 20
                      ),

                    Text(
                          "Somos especialistas em oferecer as melhores soluções em refrigeração de leite e ordenhadeiras para produtores rurais de pequeno e grande porte. Com venda, aluguel e manutenção de equipamentos, garantimos que sua produção seja sempre eficiente, segura e dentro dos mais altos padrões de qualidade. Seja para manter seu leite na temperatura ideal ou otimizar o processo de ordenha, conte com a nossa experiência e tecnologia para levar mais produtividade ao seu campo.", 
                           style: kBody,
                           textAlign: TextAlign.justify,
                        ),

                    const SizedBox(
                          height: 20
                         ),

                    Text(
                          "A EdFrio Comércio e Locação Ltda é referência no mercado, oferecendo soluções confiáveis e eficientes para quem busca qualidade e durabilidade. Nossa missão é garantir que cada cliente tenha acesso ao que há de melhor, com um atendimento transparente e comprometido.",
                          style: kBody,
                        ),
                              
                    const SizedBox(
                          height: 10
                        ),

                    Text(
                          "Com uma equipe experiente e apaixonada pelo que faz, trabalhamos para entregar inovação, confiança e excelência em cada serviço prestado. Nosso compromisso é construir parcerias duradouras, sempre prezando pela sua satisfação e pelo crescimento do seu negócio.",
                          style: kBody,
                        ),

                    const SizedBox(
                          height: 20
                        ),

                    _buildTopic("Tradição e inovação caminhando juntas"),
                    _buildTopic("Atendimento personalizado para entender suas necessidades"),
                    _buildTopic("Compromisso com qualidade e eficiência em cada detalhe"),

                    const SizedBox(
                            height: 20
                          ),

                    Text(
                            "Na EdFrio, você encontra mais do que produtos e serviços: encontra uma equipe dedicada a oferecer as melhores soluções para o seu dia a dia!",
                            style: kBody,
                        ),

                    const SizedBox(
                            height: 20
                        ),
                    
                    Text(
                          "Fale conosco e descubra como podemos ajudar você a produzir mais e melhor!", 
                          style: kBody,
                          textAlign: TextAlign.justify,
                        ),

                    const SizedBox(
                          height: 20
                        ),
                  ],
          ),
      );
  }

Widget _buildTopic(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.blue), // Ícone de marcador
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: kBody,
            ),
          ),
        ],
      ),
    );
   }
}