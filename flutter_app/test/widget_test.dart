import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart'; // Import crucial
import 'package:flutter_app/screens/view_acceil_task_screen.dart'; // Import du widget testé

void main() {
  testWidgets('Test de l\'écran d\'accueil', (WidgetTester tester) async {
    // 1. Construire l'application complète
    await tester.pumpWidget(const MyApp());

    // 2. Attendre que l'écran soit rendu (important pour les chargements initiaux)
    await tester.pumpAndSettle();

    // 3. Debug : Afficher l'arbre des widgets (optionnel)
    debugDumpApp();

    // 4. Vérifications de base
    expect(find.byType(AccueilTaskScreen),
        findsOneWidget); // Vérifie que l'écran principal est chargé

    // 5. Exemple : Vérifier un élément spécifique (adaptez à votre UI réelle)
    expect(
        find.text('0'), findsNothing); // Changez '0' par un texte réel attendu
  });
}
