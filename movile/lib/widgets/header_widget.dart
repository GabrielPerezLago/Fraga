import 'package:flutter/cupertino.dart';

class AppHeader extends StatelessWidget {
  final String tittle;
  final double width;
  final double height;
  final double fontSize;
  final double padding;
  final double margin;
  final bool renderTittle;
  const AppHeader({
    super.key,
    this.tittle = 'Cabecera',
    this.renderTittle = true,
    required this.width,
    required this.height,
    this.fontSize = 70,
    this.padding = 0.0,
    this.margin = 0.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/logo.png', height: height, width: width),
          renderTittle ? Text(tittle, style: TextStyle( fontSize: fontSize, fontWeight: FontWeight.bold, fontFamily: 'Frijole')) : SizedBox.shrink() ,
        ],
      ),
    );
  }
}