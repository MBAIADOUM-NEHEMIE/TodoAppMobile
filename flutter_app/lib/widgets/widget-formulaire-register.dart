import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/widget-alls-create.dart';

Widget buildFormRegister({
  required bool obscurePassword,
  required Function() onPasswordToggle,
}) {
  return Column(
    children: [
      TextFieldAvecIcon(
        icon: Icons.person,
        labelText: 'Nom et Prenom',
        hintText: 'Entrez votre nom et prenom',
      ),
      SizedBox(height: 16),
      TextFieldAvecIcon(
        icon: Icons.email,
        labelText: 'Votre mail',
        hintText: 'Entrez votre mail',
      ),
      SizedBox(height: 16),
      TextFieldAvecIcon(
        icon: Icons.lock,
        labelText: 'Password',
        hintText: 'Entrez votre mot de passe',
        obscureText: obscurePassword,
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: onPasswordToggle,
        ),
      ),
    ],
  );
}
