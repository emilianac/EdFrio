import 'package:edfrio/styles/style.dart';
import 'package:flutter/material.dart';

class SiteLogo extends StatefulWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  State<SiteLogo> createState() => _SiteLogoState();
}

class _SiteLogoState extends State<SiteLogo> {
  get onTap => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                  child: Text('EdFrio', style: kTitle
                  ),
                ),
              );
  }
}