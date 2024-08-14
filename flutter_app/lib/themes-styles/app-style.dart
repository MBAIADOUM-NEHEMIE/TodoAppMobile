import 'package:flutter/material.dart';

// Définir les couleurs principales de l'application
class AppColors {
  static const Color primaryColor = Color.fromRGBO(66, 164, 255, 1);
  static const Color secondaryColor = Color.fromARGB(255, 5, 5, 5);
  static const Color bouttonColor = Color.fromRGBO(238, 136, 42, 1);
  static const Color bouttonOffColor = Color.fromRGBO(253, 25, 25, 1);
  static const Color bouttonOnColor = Color.fromRGBO(66, 164, 255, 1);
  static const Color texteColor = Color.fromARGB(255, 248, 247, 246);
  static const Color backgrounColorFilled = Color.fromARGB(255, 248, 247, 246);
  static const Color borderColorFilledActive = Color.fromRGBO(238, 136, 42, 1);
  static const Color hintTextColor = Color.fromRGBO(143, 140, 140, 1);
}

// Définir les styles de texte
class AppTextStyles {
  static const TextStyle titre1 = TextStyle(
    fontSize: 24,
    fontFamily: 'Times New Roman',
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryColor,
  );

  static const TextStyle titre2 = TextStyle(
    fontSize: 20,
    color: AppColors.primaryColor,
    fontFamily: 'Roboto',
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.secondaryColor,
    fontFamily: 'Times New Roman',
  );

  static const TextStyle textbody3 = TextStyle(
    fontSize: 12,
    color: AppColors.secondaryColor,
    fontFamily: 'Times New Roman',
  );
  static const TextStyle textbody4 = TextStyle(
    fontSize: 9,
    color: AppColors.texteColor,
    fontFamily: 'Times New Roman',
  );
  static const TextStyle textbutton1 = TextStyle(
    fontSize: 18,
    color: AppColors.texteColor,
    fontFamily: 'Times New Roman',
  );
}

// Définir les styles pour les Boutons

class AppButtonStyles {
  static final ButtonStyle buttonNivau1 = ElevatedButton.styleFrom(
    backgroundColor: AppColors.bouttonColor, // Couleur de fond du bouton
    foregroundColor:
        AppColors.texteColor, // Couleur du texte et des icônes du bouton
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    minimumSize: Size(200, 50), // Taille minimale du bouton
  );
  static final ButtonStyle buttonNivau2 = ElevatedButton.styleFrom(
    backgroundColor: AppColors.texteColor, // Couleur de fond du bouton
    foregroundColor:
        AppColors.secondaryColor, // Couleur du texte et des icônes du bouton
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    minimumSize: Size(60, 60), // Taille minimale du bouton
  );

  static final ButtonStyle secondaryButton = OutlinedButton.styleFrom(
    foregroundColor: AppColors.bouttonColor, // Couleur du texte du bouton
    side: BorderSide(color: AppColors.bouttonColor), // Bordure
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static final ButtonStyle textButton = TextButton.styleFrom(
    foregroundColor: AppColors.texteColor, // Couleur du texte du bouton
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}

// Définir les styles pour les Zones de Saisi

class AppInputStyles {
  // Style principal pour les zones de saisie
  static final InputDecoration primaryInputDecoration = InputDecoration(
    filled: true, // Remplit l'arrière-plan de la zone de saisie
    fillColor: AppColors.backgrounColorFilled, // couleur de remplissage

    // Définition des bordures
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19), // Rayon des coins des bordures
      borderSide: BorderSide(
        color: AppColors.primaryColor, // Couleur de la bordure
      ),
    ),

    // Bordure utilisée lorsque la zone de saisie est activée mais pas focalisée
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19), // Rayon des coins des bordures
      borderSide: BorderSide(
        color: AppColors.primaryColor, // Couleur de la bordure activée
      ),
    ),

    // Bordure utilisée lorsque la zone de saisie est focalisée
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19), // Rayon des coins des bordures
      borderSide: BorderSide(
        color: AppColors
            .borderColorFilledActive, // Couleur de la bordure focalisée
        width: 2, // Épaisseur de la bordure focalisée
      ),
    ),

    labelText: '', // Texte de l'étiquette par défaut (label)
    labelStyle: TextStyle(
      color: AppColors.secondaryColor, // Couleur du texte de l'étiquette
    ),

    hintText:
        'Entrer ici', // Texte indicatif à l'intérieur de la zone de saisie
    hintStyle: TextStyle(
      color: AppColors.hintTextColor, // Couleur du texte indicatif
    ),
  );

  // Style secondaire pour les zones de saisie
  static final InputDecoration secondaryInputDecoration = InputDecoration(
    filled: true, // Remplit l'arrière-plan de la zone de saisie
    fillColor: AppColors.secondaryColor
        .withOpacity(0.1), // Couleur de remplissage avec opacité

    // Définition des bordures
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19), // Rayon des coins des bordures
      borderSide: BorderSide(
        color: AppColors.secondaryColor, // Couleur de la bordure
      ),
    ),

    // Bordure utilisée lorsque la zone de saisie est activée mais pas focalisée
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19), // Rayon des coins des bordures
      borderSide: BorderSide(
        color: AppColors.secondaryColor, // Couleur de la bordure activée
      ),
    ),

    // Bordure utilisée lorsque la zone de saisie est focalisée
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(19), // Rayon des coins des bordures
      borderSide: BorderSide(
        color: AppColors.primaryColor, // Couleur de la bordure focalisée
        width: 2, // Épaisseur de la bordure focalisée
      ),
    ),

    labelText: '', // Texte de l'étiquette par défaut (label)
    labelStyle: TextStyle(
      color: AppColors.secondaryColor, // Couleur du texte de l'étiquette
    ),

    hintText:
        'Enter text ici', // Texte indicatif à l'intérieur de la zone de saisie
    hintStyle: TextStyle(
      color: AppColors.secondaryColor, // Couleur du texte indicatif
    ),
  );
}
