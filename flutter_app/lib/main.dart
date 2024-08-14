import 'package:flutter/material.dart';
import 'package:flutter_app/themes-styles/app-theme.dart';
import 'screens/view-acceil-task-screen.dart'; // Assurez-vous que ce chemin est correct selon la structure de votre projet.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key); // Ajoutez 'key' comme paramètre nommé
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme, // Appliquez le thème
      home: AccueilTaskScreen(),
    );
  }
}
