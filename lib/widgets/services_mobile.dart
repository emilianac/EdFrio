import 'package:flutter/material.dart';

import '../constants/services_items.dart';
import '../styles/style.dart';

class ServicesMobile extends StatefulWidget {
  const ServicesMobile({super.key});

  @override
  State<ServicesMobile> createState() => _ServicesMobileState();
}

class _ServicesMobileState extends State<ServicesMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
            decoration: kServicesDecoration,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Column(
               mainAxisSize: MainAxisSize.min,
                     children: [
                        Text(
                            "Nossos serviços:",
                            style: kTitleServices,
                          ),
                          SizedBox(height: 50),
                      for(int i=0; i<servicesItems.length; i++)
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          decoration: kServices,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                            leading: Image.asset(
                              servicesItems[i]["img"],
                              width: 40,
                            ),
                            title: Text(
                                servicesItems[i]["title"],
                                style: kTitle,
                                textAlign: TextAlign.center,
                              ),
                            subtitle: Text(
                                servicesItems[i]["description"],
                                style: kBody,
                                textAlign: TextAlign.justify,
                              ),
                          ),
                        ),
                        const SizedBox(height: 50,),
                      ],
                ),
          ),
    );
    }
}