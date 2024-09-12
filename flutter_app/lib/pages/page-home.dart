import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all-fonctions-util.dart';
// import 'package:flutter_app/screens/view-add-task-screen.dart';
import 'package:flutter_app/themes-styles/app-style.dart';
import 'package:flutter_app/themes-styles/app-theme.dart';
import 'package:flutter_app/widgets/widget-alls-create.dart';
import 'package:flutter_app/widgets/widget-menu-lateral.dart';
import 'package:flutter_app/widgets/widget-tache.dart';
import 'package:flutter_app/models/task.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
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
      drawer: MenusLateral(),
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: Stack(
          children: [
            Positioned.fill(
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
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher une tâche...',
                        hintStyle: TextStyle(color: AppColors.texteColor),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: AppColors.navbarColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: AppColors.texteColor),
                    ),
                  ),
                  // Liste des tâches
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
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
          slecteTimeHorloge(context);
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
