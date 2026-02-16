import 'package:flutter/material.dart';
import 'package:flutter/src/painting/decoration_image.dart';
import 'package:fraga_movile/views/login_view.dart';
import 'package:fraga_movile/widgets/classic_button_widget.dart';
class ErrorView extends StatefulWidget {
  const ErrorView({super.key});

  @override
  State<ErrorView> createState() => _ErrorViewState();

}

class _ErrorViewState extends State<ErrorView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        child: Container(
          width: 400,
          height: 600,
          alignment: Alignment.center,

          child: Column(
            spacing: 100,
            children: [
              Image.asset('assets/images/noconexion.png', width: 200, height: 200,),
              Text('¡Error de Conexión!', style: TextStyle(fontFamily: 'Regular', fontSize: 55, color: Colors.white),textAlign: TextAlign.center,),
              ClassicButton(onclick: () => {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView()))
              }, text: 'Reintentar',)
            ],
          ),
        )
      ),
    );
  }
}