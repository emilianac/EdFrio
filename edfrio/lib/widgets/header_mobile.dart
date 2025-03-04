import 'package:flutter/material.dart';
import '../styles/style.dart';
import 'site_logo.dart';

class HeaderMobile extends StatefulWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  State<HeaderMobile> createState() => _HeaderMobileState();
}

class _HeaderMobileState extends State<HeaderMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 50,
            margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
            decoration: kHeaderDecoration,
            child: Row(
                children: [
                  SiteLogo(
                    onTap: widget.onLogoTap,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: widget.onMenuTap, 
                    icon: const Icon(Icons.menu),
                    ),
                    const SizedBox(width: 15),
                ],
              ),
          );
  }
}