import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/view_acceil_task_screen.dart';
import 'package:flutter_app/pages/page_home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/themes-styles/app_theme.dart';
import 'package:flutter_app/pages/page_formulaire_login.dart';

void main() async {
  // Initialisation des bindings Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Firebase avec gestion d'erreur améliorée
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, // Option recommandée
    );
    debugPrint('✅ Firebase initialisé avec succès');
  } catch (e, stackTrace) {
    debugPrint('❌ Erreur critique d\'initialisation Firebase: $e');
    debugPrint('Stack trace: $stackTrace');

    // Selon votre cas d'usage, vous pourriez vouloir :
    // 1. Afficher une interface d'erreur
    // 2. Arrêter l'application si Firebase est essentiel
    // 3. Tenter une réinitialisation

    return runApp(const FirebaseErrorScreen()); // Exemple d'écran d'erreur
  }

  // Lancement de l'application principale
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // paramètre nommé
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme, // Appliquez le thème
      home: const AccueilTaskScreen(),
      routes: {
        '/login': (context) => const WidgetFormulaireLogin(),
        '/home': (context) => const AccueilTaskScreen(),
        '/tasks': (context) => const HomePage(),
        // '/add-tasks': (context) => showCreateTaskFormDialog(context),
      },
    );
  }
}
