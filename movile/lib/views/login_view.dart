import 'package:flutter/material.dart';
import 'package:fraga_movile/widgets/default_input_widget.dart';
import 'package:fraga_movile/widgets/header_widget.dart';
import 'package:fraga_movile/widgets/button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fondo.jpeg'),
                  fit: BoxFit.cover,
                  opacity: 0.8)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
           /* mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,*/
            children: [
              AppHeader(tittle: 'Fraga', width: 200, height: 200, fontSize: 50,),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(20), child:  Text('Iniciar Sesión', style: TextStyle(fontFamily: 'Frijole', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, ))),
                    DefaulAppInput(defaultText: 'Inserta tu nombre o correo Electronico', padding: 5,),
                    DefaulAppInput(defaultText: 'Inserte Contraseña', obscureText: true, padding: 5,),
                    AppButton(text: 'Login')
                  ],
                )
              )
            ],
          ),
        ),
    );
  }
}
