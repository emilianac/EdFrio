import 'package:flutter/material.dart';

import '../constants/products_items.dart';
import '../styles/style.dart';


class ProductsMobile extends StatefulWidget {
  const ProductsMobile({super.key});

  @override
  State<ProductsMobile> createState() => _ProductsMobileState();
}

class _ProductsMobileState extends State<ProductsMobile> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: productsitems.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: kServices,
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            productsitems[index]["img"],
                                            height: 200,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            productsitems[index]["title"],
                                            style: kProductsTitle,
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 5.0),
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                  productsitems[index]["description"],
                                                  style: kProductsText,
                                                  textAlign: TextAlign.justify,
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                                Text(
                                  "Apresentamos uma pequena amostra de nossa linha completa de soluções para a indústria leiteira. Na EdFrio Comércio e Locação Ltda, oferecemos uma variedade de equipamentos e produtos de excelente qualidade, desenvolvidos para atender às necessidades específicas de cada cliente, com total compromisso com a eficiência e durabilidade. Caso queira saber mais sobre nossos produtos ou esclarecer qualquer dúvida sobre como podemos ajudar seu negócio, entre em contato conosco ou nos faça uma visita. Estamos prontos para oferecer as melhores soluções para o seu sucesso.",
                                  style: kProductsText2,
                                  textAlign: TextAlign.justify,
                                ),
                            ],
                          );
                        }
                  ),
            );        
    }
}