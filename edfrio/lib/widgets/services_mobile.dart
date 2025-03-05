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
    return ConstrainedBox(
          constraints: const BoxConstraints(
          maxWidth: 500,
        ),
    child: Column(
            children: [
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
                        style: kServicesTitleStyle,
                        textAlign: TextAlign.center,
                      ),
                    subtitle: Text(
                        servicesItems[i]["description"],
                        style: kServicesTextStyle,
                        textAlign: TextAlign.center,
                      ),
                  ),
                ),
                const SizedBox(height: 50,),
              ],
        ),
      );
    }
}