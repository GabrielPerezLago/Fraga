import 'package:flutter/cupertino.dart';
import 'package:fraga_movile/objects/SESSION.dart';
import 'package:fraga_movile/widgets/background_image_card.dart';
import 'package:fraga_movile/widgets/basic_card_widget.dart';
import 'package:fraga_movile/widgets/expand_card_widget.dart';
import 'package:fraga_movile/widgets/news_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({ super.key });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [ 
          ImageCard(tittle: 'Proximamente...', textCard: "Muchas Gracias por visitarnos : ${SESSION.instance.u?.nombre ?? ''}. Las novedades llegarán pronto , ten paciencia..., "),
          NewsWidget(),
        ]
      ),
    ));
  }
  
}