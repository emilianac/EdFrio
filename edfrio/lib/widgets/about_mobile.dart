import 'package:flutter/material.dart';

import '../styles/style.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;

    return  Container(
               margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                height: screenHeight,
                constraints: const BoxConstraints(
                    minHeight: 560
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "A EdFrio Comércio e Locação Ltda é referência no mercado, oferecendo soluções confiáveis e eficientes para quem busca qualidade e durabilidade. Nossa missão é garantir que cada cliente tenha acesso ao que há de melhor, com um atendimento transparente e comprometido.",
                                style: kAboutText,
                              ),
                              const SizedBox(
                                  height: 10
                              ),
                              Text(
                                "Com uma equipe experiente e apaixonada pelo que faz, trabalhamos para entregar inovação, confiança e excelência em cada serviço prestado. Nosso compromisso é construir parcerias duradouras, sempre prezando pela sua satisfação e pelo crescimento do seu negócio.",
                                style: kAboutText,
                              ),
                              const SizedBox(
                                  height: 10
                              ),
                                SizedBox(height: 20,),
                                _buildTopic("Tradição e inovação caminhando juntas"),
                                _buildTopic("Atendimento personalizado para entender suas necessidades"),
                                _buildTopic("Compromisso com qualidade e eficiência em cada detalhe"),
                              const SizedBox(
                                  height: 10
                              ),
                              Text(
                                "Na EdFrio, você encontra mais do que produtos e serviços: encontra uma equipe dedicada a oferecer as melhores soluções para o seu dia a dia!",
                                style: kAboutText,
                              )
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
                        ),
                         const SizedBox(
                          height: 100
                        ),
                      ],
                    )
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
              style: kAboutText,
            ),
          ),
        ],
      ),
    );
  }
}