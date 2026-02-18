
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String tittle;
  final String textCard;
  final String image;

  const ImageCard({
    super.key,
    required this.tittle,
    required this.textCard,
    this.image = 'assets/images/forest.jpeg'
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow( color: Colors.black, blurRadius: 10, offset: Offset(0, 6))
          ], 
          image: DecorationImage(image: AssetImage(image), opacity: 0.5 , fit: BoxFit.cover),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(tittle, maxLines: 1, overflow: TextOverflow.ellipsis ,style: TextStyle(color: Colors.green, fontSize: 30, fontFamily: 'Regular', fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Text(textCard, style: TextStyle(fontFamily: 'Regular', color: Colors.white, fontSize: 20, ),)
            ],
          ),
        ),
      ),
    );
  }

}