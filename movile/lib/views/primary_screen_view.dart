import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraga_movile/objects/SESSION.dart';

class PrimaryScreen extends StatefulWidget {
    const PrimaryScreen({ super.key });

    @override
    State<PrimaryScreen> createState() => _PrimaryScreenState();
}


class _PrimaryScreenState extends State<PrimaryScreen> {
  final session = SESSION.instance.u;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        child: Container(
          width: 500,
          height: 500,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(session?.nombre.toString() ?? "", style: TextStyle(color: Colors.white, fontFamily: 'Regular', fontSize: 20),),
              Text('Hola flutter', style: TextStyle(fontSize: 20),)
            ],
          )
        ),
      ),
    );
  }
}