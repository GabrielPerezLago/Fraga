import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraga_movile/models/ActivityModel.dart';
import 'package:fraga_movile/services/ActivitiesService.dart';
import 'package:fraga_movile/services/ApiService.dart';
import 'package:fraga_movile/utils/AppUtils.dart';
import 'package:fraga_movile/widgets/basic_card_widget.dart';
import 'package:fraga_movile/widgets/expand_card_widget.dart';

class ActivitiesUserView extends StatefulWidget {
  const ActivitiesUserView({ super.key });

  @override
  State<StatefulWidget> createState() => _ActivitiesUserView();
}

class _ActivitiesUserView extends State<ActivitiesUserView> {
  final ActivitiesService service = ActivitiesService();
  late Future<List<ActivityModel>> model;
  int? expand;
  List<ActivityModel> activitiesModel = [];
  final AppUtils util = AppUtils();

  late final realizada = Text('Realizada', style: TextStyle(fontSize: 20, fontFamily: 'Regular', fontWeight: FontWeight.bold,color: Colors.blue),);
  final noAsist = Text('Realizada', style: TextStyle(fontSize: 20, fontFamily: 'Regular', fontWeight: FontWeight.bold,color: Colors.red),);


  @override
  void initState() {
    super.initState();
    model = service.getActivitiesUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView( child: Column(
      children: [
        Padding(padding: EdgeInsets.all(20), child: Text('Tus Reservas', style: TextStyle(fontFamily: 'Regular', color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold))),
        FutureBuilder<List<ActivityModel>>(future: model, builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator(color: Colors.green,));
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Padding(padding: EdgeInsets.all(20), child: Text('Error al cargar las actividades', style: TextStyle(fontFamily: 'Regular', fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Padding(padding: EdgeInsets.all(20), child: Text('¡Vaya!: Aún no as reservado ninguna actividad', style: TextStyle(fontFamily: 'Regular', fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),));
          }

          if(this.activitiesModel.isEmpty){
            this.activitiesModel = snapshot.data!;
          }

          return Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Column(
              children: [
                ...activitiesModel.asMap().entries.map((value) {
                  int index = value.key;
                  ActivityModel activity = value.value;

                  bool isExpand = expand == index;

                  if(isExpand) {
                    return GestureDetector(
                      onTap: () => { setState(() {
                        expand = expand == index ? null : index;
                      }) },
                      child: ExpandCard(image: util.getUrlImages(activity.image ?? "setas") ?? "assets/images/setas.jpg" , title: activity.nombre, data: [ activity.descripcion ?? "", "Plazas ${ activity.plazas }", "Fecha: ${activity.fecha}",
                        if(activity.reaalizada == true) "Realizada",
                        if(activity.noAsist == true) " No Asistida"
                      ], cancelarEvent:activity.noAsist != false  && activity.reaalizada != false ?
                          () {
                            service.cancelar(activity.id ?? "");
                            setState(() {
                            activitiesModel.removeAt(index);
                            expand = null;
                            });}  : null),
                    );
                  } else
                    return GestureDetector( onTap: () => {
                      setState(() {
                        expand = index;
                      })
                    }, child: SimpleCard(tittle: activity.nombre, image: util.getUrlImages(activity.image ?? "setas") ?? 'assets/images/setas.jpg',)
                    );
                }
              ).toList(),
              ],
            ),
          );

        }),
      ],
    ),));
  }

}