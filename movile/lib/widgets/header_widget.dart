import 'package:flutter/cupertino.dart';

class AppHeader extends StatelessWidget {
  final String tittle;
  final double width;
  final double height;
  final double fontSize;
  const AppHeader({
    super.key,
    required this.tittle,
    required this.width,
    required this.height,
    this.fontSize = 70
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/logo.png', height: height, width: width),
          Text(tittle, style: TextStyle( fontSize: fontSize, fontWeight: FontWeight.bold, fontFamily: 'Frijole'))
        ],
      ),
    );
  }
}