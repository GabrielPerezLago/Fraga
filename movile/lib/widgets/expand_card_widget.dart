import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraga_movile/widgets/button_widget.dart';
import 'package:fraga_movile/widgets/small_button_widget.dart';

class ExpandCard extends StatelessWidget {
  final String image;
  final String title;
  final List<String> data;
  const ExpandCard({ super.key, this.image = "assets/images/yoga.jpg" , required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 500,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [ BoxShadow(color: Colors.black87, blurRadius: 10, offset: Offset(0, 6)) ]
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                SizedBox(width: double.infinity, height: 200, child: Image(image: AssetImage(image), fit: BoxFit.cover,),),
                Expanded(child:
                  Padding(padding: EdgeInsets.all(20), child:
                      Column(
                        children: [
                          Text(title, style: TextStyle(fontFamily: 'Regular', fontWeight: FontWeight.bold, fontSize: 50),),
                          ...data.map((i) =>  Padding(padding: EdgeInsets.all(5), child: Text(i, style: TextStyle(fontFamily: 'Regular', fontWeight: FontWeight.bold, fontSize: 20),),)).toList(),
                        ],
                      )
                  ),
                ),

                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsetsGeometry.all(10), child:SmallButton(text: 'Reservar', onClick: () {}))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}