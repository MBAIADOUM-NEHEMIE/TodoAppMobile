import 'package:flutter/material.dart';
import 'screens/view-acceil-task-screen.dart';
import 'package:flutter_app/pages/page-home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/themes-styles/app-theme.dart';
import 'package:flutter_app/pages/page-formulaire-login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // paramètre nommé
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme, // Appliquez le thème
      home: AccueilTaskScreen(),
      routes: {
        '/login': (context) => WidgetFormulaireLogin(),
        '/home': (context) => AccueilTaskScreen(),
        '/tasks': (context) => HomePage(),
        // '/add-tasks': (context) => showCreateTaskFormDialog(context),
      },
    );
  }
}
