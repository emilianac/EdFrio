import 'package:flutter/material.dart';

import '../constants/services_items.dart';
import '../styles/style.dart';

class ServicesDesktop extends StatefulWidget {
  const ServicesDesktop({super.key});

  @override
  State<ServicesDesktop> createState() => _ServicesDesktopState();
}

class _ServicesDesktopState extends State<ServicesDesktop> {
  @override
  Widget build(BuildContext context) {

    return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
                decoration: kServicesDecoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                   children: [
                      Text(
                          "Nossos serviços:",
                          style: kTitleServices,
                        ),
                        SizedBox(height: 50),
                        LayoutBuilder(
                          builder: (context, constraints) {
                          final boxWidth = (constraints.maxWidth - 64) / servicesItems.length;
                          return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      for (int i = 0; i < servicesItems.length; i++)
                                      Container(
                                          width: boxWidth,
                                          decoration: kServices,
                                          margin: EdgeInsets.all(8.0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                  Image.asset(
                                                      servicesItems[i]["img"],
                                                      width: 70,
                                                    ),
                                                  SizedBox(height: 8.0),
                                                  Text(
                                                      servicesItems[i]["title"],
                                                      style: kTitle,
                                                      textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 4.0),
                                                  Container(
                                                      padding: EdgeInsets.all(10.0),
                                                        child: Text(
                                                            servicesItems[i]["description"],
                                                            style: kBody,
                                                            textAlign: TextAlign.justify,
                                                          ),
                                                    ),
                                                ],
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