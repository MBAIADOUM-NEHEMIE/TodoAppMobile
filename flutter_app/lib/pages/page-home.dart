import 'package:flutter/material.dart';
import 'package:flutter_app/themes-styles/app-theme.dart';
import 'package:flutter_app/widgets/widget-superieur.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('To-Do List'),
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // Decoration appliquée à la page entière
        decoration: AppTheme.backgroundDecoration,
        child: Column(
          children: [
            WidgetSuperieur(
              svgImagePath: 'assets/images/widget-sup.svg',
              pngImagePath: 'assets/images/image-group-widget-sup-home.png',
              appBarTitle: 'To-do Liste',
            ),
          ],
        ),
      ),
    );
  }
}
