import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/widget-alls-create.dart';

Widget buildFormLogin({
  required bool obscurePassword,
  required Function() onPasswordToggle,
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  return Column(
    children: [
      TextFieldAvecIcon(
        controller: emailController,
        icon: Icons.person,
        labelText: 'Votre mail',
        hintText: 'Entrez votre mail',
      ),
      SizedBox(height: 16),
      TextFieldAvecIcon(
        controller: passwordController,
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
      // validator: (val) =>
      // val!.length < 6 ? 'Entrez un mot de passe de 6+ caractères' : null,
    ],
  );
}
