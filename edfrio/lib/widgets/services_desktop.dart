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
                padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                child: LayoutBuilder(
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
                                                      style: kServicesTitleStyle,
                                                      textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 4.0),
                                                  Text(
                                                      servicesItems[i]["description"],
                                                      style: kServicesTextStyle,
                                                      textAlign: TextAlign.center,
                                                  ),
                                              ],
                                    ),
                                ),
                          ],
                       );
                    },
                  ),
            );
    }
}