import 'package:edfrio/constants/products_items.dart';
import 'package:flutter/material.dart';

import '../styles/style.dart';



class ProductsDesktop extends StatefulWidget {
  const ProductsDesktop({super.key});

  @override
  State<ProductsDesktop> createState() => _ProductsDesktopState();
}

class _ProductsDesktopState extends State<ProductsDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                  child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                      Text(
                          "Alguns dos nossos produtos:",
                          style: kTitle,
                        ),
                      LayoutBuilder(
                          builder: (context, constraints) {
                          final boxWidth  = (constraints.maxWidth - 64) / productsitems.length;
                          return Column (
                            children: [
                            Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      for (int i = 0; i < productsitems.length; i++)
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                            width: boxWidth,
                                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                    Image.asset(
                                                        productsitems[i]["img"],
                                                        height: 200,
                                                        width: 200,
                                                        fit: BoxFit.cover
                                                      ),
                                                    SizedBox(height: 5.0),
                                                    Text(
                                                        productsitems[i]["title"],
                                                        style: kTitleProducts,
                                                        textAlign: TextAlign.center,
                                                    ),
                                                    SizedBox(height: 5.0),
                                                    Container(
                                                      padding: EdgeInsets.all(10.0),
                                                        child: Text(
                                                            productsitems[i]["description"],
                                                            style: kBody,
                                                            textAlign: TextAlign.justify,
                                                          ),
                                                    ),
                                                  ],
                                              ),
                                          ),
                                        ),
                                  ],
                                ),
                        SizedBox(height: 50),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
                            decoration: kServicesDecoration,
                            alignment: Alignment.center,
                            height: 200,
                            child: Text(
                              "Apresentamos uma pequena amostra de nossa linha completa de soluções para a indústria leiteira. Na EdFrio Comércio e Locação Ltda, oferecemos uma variedade de equipamentos e produtos de excelente qualidade, desenvolvidos para atender às necessidades específicas de cada cliente, com total compromisso com a eficiência e durabilidade",
                              style: kBodyProducts,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                    ],
                  );
                },
                  ),
                   ],
                  ),
            );
  }  
}