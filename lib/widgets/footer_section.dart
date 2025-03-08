import 'package:flutter/material.dart';

import '../styles/style.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: kFooderDecoration,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Column(
                    children: [
                    Text(
                      "Praça Santos Dumont, loja nº 03, Bairro do Campo, Barbacena/MG - 36200-327",
                      style: kFooterText,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "Feito por Emiliana Candida",
                      style: kFooterSignature,
                    ),
                  ]
                ),
            );
  }
}