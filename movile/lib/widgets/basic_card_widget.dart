import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  final String tittle;
  final bool renderImage;
  final String image;
  const SimpleCard({
    super.key,
    required this.tittle,
    this.renderImage = true,
    this.image = 'assets/images/setas.jpg'
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 70,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow( color: Colors.black54, blurRadius: 10, offset: Offset(0, 6))
            ],
          ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Row(
              children: [
                renderImage ? SizedBox(width: 90, height: double.infinity, child: Image(image: AssetImage(image), fit: BoxFit.cover,),) : SizedBox.shrink(),
                Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(tittle, style: TextStyle(fontFamily: 'Regular', fontSize: 20, fontWeight: FontWeight.w900),),
                ))
              ],
            ),
          ),
        ),
        ),
    );
  }
}

// Row(
//             children: [
//               renderImage ? SizedBox(width: 90, height: double.infinity, child: Image(image: AssetImage(image), fit: BoxFit.cover,),) : SizedBox.shrink(),
//               Text(tittle, style: TextStyle(fontSize: 20, fontFamily: 'Regular'),)
//             ],