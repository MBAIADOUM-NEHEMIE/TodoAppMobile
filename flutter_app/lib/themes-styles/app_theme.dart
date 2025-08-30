// lib/theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static BoxDecoration get backgroundDecoration {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFFF4F3F3), // Couleur de début du dégradé
          Color(0xFF42A4FF), // Couleur de fin du dégradé
        ],
      ),
    );
  }

  static ThemeData get theme {
    return ThemeData(
      // Appliquez le style des boutons ici
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD17118), // Couleur de fond du bouton
          foregroundColor: Colors.white, // Couleur du texte
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Arrondi des coins
          ),
          minimumSize: const Size(250, 60), // Taille minimale du bouton
        ),
      ),
      scaffoldBackgroundColor: Colors
          .transparent, // Utiliser une couleur transparente pour permettre le fond de dégradé
    );
  }
}
