import 'package:flutter/material.dart';
import 'package:flutter_app/themes-styles/app-style.dart';

// fonction pour le titre de la page

Widget builderTitle({required String titleText}) {
  return Text(
    titleText,
    style: AppTextStyles.titre1,
    textAlign: TextAlign.center,
  );
}

// fonction pour les sous-titres

Widget builderSubtitle(
    {required String subtitleText1, required String subtitleText2}) {
  return Column(
    children: [
      Text(subtitleText1, style: AppTextStyles.titre2),
      SizedBox(height: 20),
      Text(subtitleText2, style: AppTextStyles.textbody3),
    ],
  );
}

// fonction pour les buttons

Widget builderLoginButton(
    {required VoidCallback onPressed, required String buttonText}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: AppButtonStyles.buttonNivau1,
    child: Text(buttonText),
  );
}

Widget builderForgotPasswordButton(
    {required VoidCallback onPressed, String text = 'Mot de passe oublié ?'}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(text, style: TextStyle(color: Colors.blue)),
  );
}

// fonction pour le trai separateur

Widget builderDividerWithText(String text) {
  return Row(
    children: [
      Expanded(child: Divider(thickness: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(text, style: AppTextStyles.textbody4),
      ),
      Expanded(child: Divider(thickness: 1)),
    ],
  );
}

// fonction pour l'icon de retour en arrière

Widget builderBackButton(BuildContext context,
    {Color iconColor = Colors.black}) {
  return IconButton(
    icon: Icon(Icons.arrow_back, color: iconColor),
    onPressed: () {
      Navigator.pop(context); // Revenir en arrière
    },
  );
}

// fonction pour le text de l'option de connexion

Widget buildTextWithLink({
  required BuildContext context,
  required String staticText,
  required String clickableText,
  required VoidCallback onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        staticText,
        style: AppTextStyles.textbody4,
      ),
      GestureDetector(
        onTap: onTap,
        child: Text(
          clickableText,
          style: AppTextStyles.textbody4.copyWith(color: Colors.blue[800]),
        ),
      ),
    ],
  );
}
