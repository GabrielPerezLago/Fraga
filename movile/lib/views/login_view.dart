import 'package:flutter/material.dart';
import 'package:fraga_movile/objects/SESSION.dart';
import 'package:fraga_movile/services/LoginService.dart';
import 'package:fraga_movile/views/error_view.dart';
import 'package:fraga_movile/views/primary_screen_view.dart';
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
  String _error = "";
  final LoginService login = LoginService();
  // Controladores Inputs
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nacimientoController = TextEditingController();

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
                      // Texto Principal
                      Padding(padding: EdgeInsets.all(40), child: Text(_register ? 'Registrate': 'Iniciar Sesión', style: TextStyle(fontFamily: 'Regular', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50))),

                      // *********** FORMULARIO ***********

                      // **** Nombre
                      _register ? DefaulAppInput(defaultText: 'Inserta tu nombre y Apellidos', padding: 5, controller: nameController,) : SizedBox.shrink(),
                      // **** Email
                      DefaulAppInput( defaultText: 'Inserta tu Correo Electronico', padding: 5, controller: emailController,),
                      // **** Password
                      DefaulAppInput(defaultText: 'Inserta tu Contraseña', obscureText: true, padding: 5, controller: passwordController,),
                      // **** Nacimiento
                      _register ? DefaulAppInput(defaultText: 'Inserta tu Fecha de nacimiento', padding: 5, controller: nacimientoController,) : SizedBox.shrink(),

                      Text(_error, style: TextStyle(fontFamily: 'Regular', color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.all(20), child: AppButton(text: !_register ? 'Inciar Sesión' : 'Registrarse', onClick: () async {
                        final email = emailController.text;
                        final password = passwordController.text;

                        if(!_register) {
                          try {

                            setState(() {
                              _error = "";
                            });

                            if (email.isEmpty || password.isEmpty) throw Exception("empty");
                            await login.login(email, password);

                            SESSION.instance.isLogged ? Navigator.push(context, MaterialPageRoute(builder: (_) => PrimaryScreen())) : _error = "Algo ha salido mal";

                          } catch (ex) {

                            if(ex.toString().contains("400")){
                              setState(() {
                                _error = "Las credenciales no son correctas";
                              });
                            } else if (ex.toString().contains("empty")) {
                              _error = "Debes rellenar los campos ";
                            } else {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => ErrorView()));
                            }
                          }
                        } else if (_register) {
                          try {
                            final nombre = nameController.text;
                            final nacimiento = nacimientoController.text;


                            setState(() {
                              _error = "";
                            });

                            if (
                                email.isEmpty ||
                                password.isEmpty ||
                                nombre.isEmpty ||
                                nacimiento.isEmpty
                            ) throw Exception("empty");

                            await login.register(nombre, email, password,  nacimiento);
                            SESSION.instance.isLogged ? Navigator.push(context, MaterialPageRoute(builder: (_) => PrimaryScreen())) : _error = "Algo a salido mal";


                          } catch (ex) {
                            print("Error : " + ex.toString());
                            if(ex.toString().contains("400")){
                              setState(() {
                                _error = "Las credenciales no son correctas";
                              });
                            } else if (ex.toString().contains("empty")) {
                              _error = "Debes rellenar los campos ";
                            } else {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => ErrorView()));
                            }
                          }
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
