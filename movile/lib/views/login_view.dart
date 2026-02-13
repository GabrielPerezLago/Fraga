import 'package:flutter/material.dart';
import 'package:fraga_movile/services/LoginService.dart';
import 'package:fraga_movile/widgets/default_input_widget.dart';
import 'package:fraga_movile/widgets/header_widget.dart';
import 'package:fraga_movile/widgets/button_widget.dart';
import 'package:fraga_movile/widgets/classic_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _register = false;
  final LoginService login = LoginService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppHeader(
                  renderTittle: false,
                  width: 250,
                  height: 250,
                  fontSize: 50,
                  padding: 10,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(40), child: Text('Iniciar Sesión', style: TextStyle(fontFamily: 'Frijole', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30))),
                      _register ? DefaulAppInput(defaultText: 'Inserta tu nombre y Apellidos', padding: 5, controller: emailController,) : SizedBox.shrink(),
                      DefaulAppInput( defaultText: 'Inserta tu Correo Electronico', padding: 5, controller: emailController,),
                      DefaulAppInput(defaultText: 'Inserta tu Contraseña', obscureText: true, padding: 5, controller: passwordController,),
                      _register ? DefaulAppInput(defaultText: 'Inserta tu Fecha de nacimiento', padding: 5, controller: emailController,) : SizedBox.shrink(),

                      Padding(padding: EdgeInsets.all(20), child: AppButton(text: 'Login', onClick: () async {
                        final email = emailController.text;
                        final password = passwordController.text;

                        if(!_register) {
                          await login.login(email, password);
                        }

                      }),),
                      ClassicButton(onclick: () => { setState(() {
                        _register = !_register;
                      }) }, text: _register ? 'Iniciar Sesion' : 'Registarse',),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
