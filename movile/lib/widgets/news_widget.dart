import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraga_movile/widgets/basic_card_widget.dart';

class NewsWidget extends StatelessWidget {

  const NewsWidget({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text("Noticias", style: TextStyle(fontFamily: 'Regular', fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
          Column(
            children: [
              SimpleCard(tittle: 'Nuevas Rutas de Senderismo', image: 'assets/images/senderismo.jpeg',),
              SimpleCard(tittle: 'Nuevas Rutas de Recoleccion de Setas'),

            ],
          )
        ],
      ),
    );
  }
}