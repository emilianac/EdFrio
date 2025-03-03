import 'package:edfrio/constants/colors.dart';
import 'package:edfrio/constants/nav_items.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          //Main
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.transparent, 
                CustomColor.scaffoldBg,
                ],
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                Text("EdFrio",),
                Spacer(),

                for(int i = 0; i<navTitles.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(onPressed: (){}, 
                  child: Text(navTitles[i]),
                  ),
                ),
              ],
            ),
          ),

           //Info
          Container(
            height: 500,
            width: double.maxFinite,
            color: Color(0xFF1E3D6D),
          ),

           //Products
          Container(
            height: 500,
            width: double.maxFinite,
            color: Colors.blueGrey,
          ),

           //Contact
          Container(
            height: 500,
            width: double.maxFinite,
            color: Colors.blueGrey,
          ),

          //Footer
          Container(
            height: 500,
            width: double.maxFinite,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}