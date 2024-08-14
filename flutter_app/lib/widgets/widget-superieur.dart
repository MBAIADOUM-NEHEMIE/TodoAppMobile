import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetSuperieur extends StatelessWidget {
  // Déclaration des variables

  final String? svgImagePath; // Chemin de l'image SVG
  final String? pngImagePath; // Chemin de l'image PNG
  final String appBarTitle; // Titre de l'AppBar

  // Initialisation du constructeur
  const WidgetSuperieur({
    this.svgImagePath,
    this.pngImagePath,
    this.appBarTitle = 'To-Do App', // Valeur par défaut
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Première image en bas, affichée seulement si svgImagePath n'est pas null
        if (svgImagePath != null)
          SvgPicture.asset(
            svgImagePath!,
            width: double.infinity,
            height: 400,
          ),
        AppBar(
          title: Text(appBarTitle),
        ),
        // Deuxième image au-dessus de la première, affichée seulement si pngImagePath n'est pas null
        if (pngImagePath != null)
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              pngImagePath!,
              width: double.infinity,
              height: 400,
            ),
          ),
      ],
    );
  }
}
