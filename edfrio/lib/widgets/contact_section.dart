import 'package:edfrio/constants/size.dart';
import 'package:edfrio/constants/sns_links.dart';
import 'package:flutter/material.dart';

import '../styles/style.dart';
import 'custom_text_field.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                decoration: kBoxContact,
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                      Text(
                          "Entre em contato conosco:",
                          style: kProductsTitle2,
                        ),
                      const SizedBox(
                            height: 50,
                      ),
                      ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 700,
                            maxHeight: 100,),
                          child: LayoutBuilder(builder:(context, constraints) {
                              if (constraints.maxWidth>kMinDesktopWidth){
                              return buildEmailFieldMobile();
                              }
                              return buildEmailFielDesktop();
                            }
                      ),
                      ),

                      SizedBox(height: 15,),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700,),
                        child: CustomTextField(hintText: "Seu e-mail"),
                      ),

                      SizedBox(height: 15,),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700,),
                        child: CustomTextField(
                          hintText: "Sua mensagem",
                          maxLines: 20,
                        ),
                      ),

                      SizedBox(height: 15,),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700,),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: (){}, 
                            style: kButton,
                            child: Text(
                              "Entre em contato!"
                              ),
                            ),
                        ),
                      ),

                      SizedBox(height: 30,),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300,),
                        child: const Divider(),
                        ),
                        SizedBox(height: 15,),

                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                js.context.callMethod('open', [SnsLinks.whatsapp]);
                              },
                              child: Image.asset(
                                "assets/images/whatsapp.png",
                                width: 38,
                                ),
                              ),
                               InkWell(
                              onTap: () {
                                js.context.callMethod('open', [SnsLinks.email]);
                              },
                              child: Image.asset(
                                "assets/images/email.png",
                                width: 38,
                                ),
                              ),
                            InkWell(
                              onTap: () {
                                js.context.callMethod('open', [SnsLinks.instagram]);
                              },
                              child: Image.asset(
                                "assets/images/instagram.png",
                                width: 38,
                                ),
                              ),
                             InkWell(
                              onTap: () {
                                js.context.callMethod('open', [SnsLinks.facebook]);
                              },
                              child: Image.asset(
                                "assets/images/facebook.png",
                                width: 38,
                                ),
                              ),
                          ],
                        ),
                   ],
                ),
              );
  }

  Column buildEmailFieldMobile(){
    return Column(
                children: [
                      Flexible(
                         child: CustomTextField(hintText: "Seu nome")
                          ),
                       SizedBox(height: 15,),
                       Flexible(
                          child: CustomTextField(hintText: "Seu telefone")
                        ),
                   ],
    );
  }

   Row buildEmailFielDesktop(){
    return Row(
                children: [
                      Flexible(
                         child: CustomTextField(hintText: "Seu nome")
                          ),
                       SizedBox(width: 15,),
                       Flexible(
                          child: CustomTextField(hintText: "Seu telefone")
                        ),
                   ],
    );
  }
}