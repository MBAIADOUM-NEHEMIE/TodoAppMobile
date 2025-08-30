import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all_fonctions_util.dart';
// import 'package:flutter_app/screens/view-add-task-screen.dart';
import 'package:flutter_app/themes-styles/app_style.dart';
import 'package:flutter_app/themes-styles/app_theme.dart';
import 'package:flutter_app/widgets/widget_alls_create.dart';
import 'package:flutter_app/widgets/widget_menu_lateral.dart';
import 'package:flutter_app/widgets/widget_tache.dart';
import 'package:flutter_app/models/task.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = List.generate(
      20,
      (index) => Task(
        id: index + 1,
        titre: 'Tâche ${index + 1}',
        description: 'Description de la tâche ${index + 1}',
        priorite: getPriority(index),
        dateDebut: DateTime(2024, 8, 26, 14, 30),
        dateFin: DateTime(2024, 8, 26, 16, 30),
        groupe: null,
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(
        context,
        onMenuTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onUserTap: () {
          // Action lorsque l'icône utilisateur est cliquée
        },
      ),
      drawer: const MenusLateral(),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: Stack(
          children: [
            const Positioned.fill(
              child: WidgetSuperieur(
                svgImagePath: 'assets/images/widget-sup.svg',
                pngImagePath: 'assets/images/image-group-widget-sup-home.png',
              ),
            ),
            // Contenu principal
            Positioned.fill(
              child: Column(
                children: [
                  // Barre de recherche
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher une tâche...',
                        hintStyle: const TextStyle(color: AppColors.texteColor),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: AppColors.navbarColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: AppColors.texteColor),
                    ),
                  ),
                  // Liste des tâches
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: TaskList(
                          tasks:
                              tasks), // Utilisation de TaskList pour afficher les tâches
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildNavbar(
        onHomeTap: () {
          // Fonction pour actualiser la page au clic de l'icône Home
          refreshPage(context);
        },
        onCalendarTap: () {
          // Fonction pour les actions au clic du Calendrier
          dateSelectionCalender(context);
        },
        onClockTap: () {
          // Fonction pour les actions au clic de l'horloge
          slecteTimeHorloge(
            context,
            (selectedTime) {
              // Action à effectuer avec l'heure sélectionnée
              log('Heure sélectionnée : ${selectedTime.format(context)}');
            },
          );
        },
        onProfileTap: () {
          // Fonction pour les actions au clic de l'icône Profil
        },
      ),
      floatingActionButton: buildFloatingActionButton(
        onPlusTap: () {
          showCreateTaskFormDialog(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
