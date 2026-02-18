import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraga_movile/objects/SESSION.dart';
import 'package:fraga_movile/views/activities_user_view.dart';
import 'package:fraga_movile/views/activities_view.dart';
import 'package:fraga_movile/views/home_view.dart';
import 'package:fraga_movile/widgets/classic_button_widget.dart';

class PrimaryScreen extends StatefulWidget {
    const PrimaryScreen({ super.key });

    @override
    State<PrimaryScreen> createState() => _PrimaryScreenState();
}


class _PrimaryScreenState extends State<PrimaryScreen> {
  int _currentIndex = 0;

  final session = SESSION.instance.u;
  final List<Widget> _paginas = [
    HomeView(),
    ActivitiesView(),
    ActivitiesUserView()
  ];
  String _text = "Hola";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading:Image(image: AssetImage('assets/images/logo.png'), width: 80, height: 80,) ,
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(SESSION.instance.u?.nombre ?? "", style: TextStyle(fontFamily: 'Regular', fontWeight: FontWeight.bold),)
          ], ),
        actions: [
          Padding(padding: EdgeInsets.all(5), child: Icon(Icons.account_circle, size: 40, color: Colors.brown,),)
        ],
        
      ),
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
        child: _paginas[_currentIndex],
      ),
     bottomNavigationBar: BottomNavigationBar( 
         currentIndex: _currentIndex, 
         onTap: (index) { setState( () => {
           _currentIndex = index });
           },
         selectedItemColor: Colors.green, 
         unselectedItemColor: Colors.brown, 
         selectedFontSize: 15, 
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio", ), 
           BottomNavigationBarItem(icon: Icon(Icons.hiking), label: 'Actividades'), 
           BottomNavigationBarItem(icon: Icon(Icons.list), label: "Reservas"),
           BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Cerrar Sesión")
     ]),
    );
  }
}