import 'package:flutter/material.dart';
import 'package:flutter_app/themes-styles/app-style.dart';

class TextFieldAvecIcon extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;

  const TextFieldAvecIcon({
    required this.icon,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 8),
            Text(
              labelText,
              style: AppTextStyles.bodyText,
            ),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: AppInputStyles.primaryInputDecoration.copyWith(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
