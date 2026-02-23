

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fraga_movile/services/ActivitiesService.dart';
import 'package:fraga_movile/utils/AppUtils.dart';
import 'package:fraga_movile/widgets/button_widget.dart';
import 'package:fraga_movile/widgets/default_input_widget.dart';

class CreateActivityView extends StatefulWidget {
  const CreateActivityView({ super.key });

  @override
  State<StatefulWidget> createState() => _CreateActivityViewState();
}

class _CreateActivityViewState extends State<CreateActivityView> {

  final utils = AppUtils();
  final service = ActivitiesService();


  final nombreController = TextEditingController();
  final descController = TextEditingController();
  final fechaController = TextEditingController();
  final plazasController = TextEditingController();

  String selectedImage = 'setas';
  final List<String> FSelectorOptions = [
    'yoga',
    'setas',
    'senderismo',
    'ciclismo'
  ];

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center( child:  SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: EdgeInsets.all(40), child: Text('Crear Actividad', style: TextStyle(fontFamily: 'Regular', fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold ),),),
          Container(
            alignment: Alignment.center,
            child: Padding(padding: EdgeInsets.all(15),
              child: Column(
                spacing: 20.0,
                children: [
                  DefaultAppInput(defaultText: 'Nombre de la Actividad', controller: nombreController),
                  DefaultAppInput(defaultText: 'Descripcion de la Actividad', controller: descController),
                  TextFormField(
                    controller: plazasController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],

                    decoration: InputDecoration(
                      hintText: "Plazas",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: fechaController,
                    readOnly: true,
                    onTap: () async {
                      final pickedFecha = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(3000), initialDate: DateTime.now());

                      if (pickedFecha != null ) {
                        final pickedHora = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());


                        fechaController.text =
                            "${pickedFecha.year}/"
                            "${pickedFecha.month.toString().padLeft(2, '0')}/"
                            "${pickedFecha.day.toString().padLeft(2, '0')}"
                            " a las ${pickedHora?.format(context)}";

                      }
                    },
                    style: TextStyle(
                      fontFamily: 'Regular',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Selecciona fecha",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      suffixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),

                  ),
                  DropdownButtonFormField<String>(
                    value: selectedImage,
                    items:  FSelectorOptions.map( (option) {
                      return DropdownMenuItem<String>(value: option ,child: Text(option));
                    }).toList() ,
                    onChanged: (value) {
                      setState(() {
                        selectedImage = value!;
                      });
                    },
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    style: TextStyle(fontFamily: 'Regular', fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 0.5)
                      ),
                    ),
                  ),
                  AppButton(text: 'Crear', onClick: () async {

                    final nombre = nombreController.text;
                    final desc = descController.text;
                    final fecha =  utils.invertParseFecha(fechaController.text);
                    final plazas = int.tryParse(plazasController.text);
                    final imagen = selectedImage;

                    await service.crear(nombre, desc, fecha, plazas!, imagen);

                    dispose();

                  })
                ],
              ),),
          )
        ],
      ),
    )));
  }

  @override
  void dispose() {
    nombreController.dispose();
    descController.dispose();
    fechaController.dispose();
    plazasController.dispose();
    super.dispose();
  }

}