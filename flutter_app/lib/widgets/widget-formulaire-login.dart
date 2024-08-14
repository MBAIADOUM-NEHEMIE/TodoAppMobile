import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/widget-textfield-avec-icon.dart';

Widget buildFormLogin({
  required bool obscurePassword,
  required Function() onPasswordToggle,
}) {
  return Column(
    children: [
      TextFieldAvecIcon(
        icon: Icons.person,
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
