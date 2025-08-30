import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all_fonctions_util.dart';
import 'package:flutter_app/themes-styles/app_theme.dart';
import 'package:flutter_app/pages/page_formulaire_login.dart';
import 'package:flutter_app/widgets/widget_alls_create.dart';

class AccueilTaskScreen extends StatelessWidget {
  const AccueilTaskScreen({super.key});

  @override
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
            const WidgetSuperieur(
              svgImagePath: 'assets/images/widget-sup.svg',
              pngImagePath: 'assets/images/image-group-widget-supp.png',
              // appBarTitle: 'To-do Liste',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        children: [
                          Text(
                            'Regrouper et Organiser touts vos tâches et sous-tâche ',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: builderLoginButton(
                            onPressed: () {
                              // Navigation vers la page du formulaire
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WidgetFormulaireLogin()),
                              );

                              // Logique du bouton ici
                            },
                            // child: Text('Lets Start'),
                            buttonText: 'Lets Start',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
