import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fraga_movile/models/ActivityModel.dart';
import 'package:fraga_movile/services/ActivitiesService.dart';
import 'package:fraga_movile/services/ApiService.dart';
import 'package:fraga_movile/utils/AppUtils.dart';
import 'package:fraga_movile/widgets/basic_card_widget.dart';
import 'package:fraga_movile/widgets/expand_card_widget.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({ super.key });

  @override
  State<StatefulWidget> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  final AppUtils util = AppUtils();
  late Future<List<ActivityModel>> activitiesFuture;
  final ActivitiesService service = ActivitiesService();
  int? expandCards;

  @override
  void initState() {
    super.initState();
    try {
      activitiesFuture = service.getActivitiesNoReservations();
    } catch (ex) {
      throw Exception("Error ${ex}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20), child: Text('Actividates', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, fontFamily: 'Regular', color: Colors.white),),),
          Padding(padding: EdgeInsets.all(10), child: Text('Reserva tu plaza en alguna de nuestras actividades al aire libre', style: TextStyle(fontSize: 30, fontFamily: 'Regular', color: Colors.lightGreenAccent, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
          FutureBuilder<List<ActivityModel>>(future: activitiesFuture , builder: (context, snapshot) {
            // Con eto capturo posibles errores
            if (snapshot.connectionState == ConnectionState.waiting){
              return Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator(color: Colors.green));
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Padding(padding: EdgeInsets.all(20), child: Text('Error al cargar las actividades', style: TextStyle(fontFamily: 'Regular', fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Padding(padding: EdgeInsets.all(20), child: Text('¡Vaya!, no hay actividades en este momento o te as anotado a todas ', style: TextStyle(fontFamily: 'Regular', fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red), textAlign: TextAlign.center,));
            }

            final activities = snapshot.data!;

            return Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Column(
                children: [
                  ...activities.asMap().entries.map((activity)  {
                    int index = activity.key;
                    ActivityModel model = activity.value;

                    bool isExpand = expandCards == index;

                    if (isExpand) {
                      return GestureDetector(onTap: () => {
                        setState(() {
                          expandCards = expandCards == index ? null : index;
                        })
                      }, child: ExpandCard( image: util.getUrlImages(model.image ?? "setas") ?? "assets/images/setas.jpg", title: model.nombre, data: [model.descripcion ?? "", "Plazas: ${model.plazas.toString()}", "Fecha: ${model.fecha}"],),) ;
                    } else {
                      return GestureDetector( onTap: () => {
                        setState(() {
                          expandCards = index;
                        })
                      }, child: SimpleCard(tittle: model.nombre, image: util.getUrlImages(model.image ?? "setas") ?? 'assets/images/setas.jpg',),);
                    }
                  }).toList(),
                ],
              ),
            );
          })
        ],
      ),
    ),
    );
  }
}