import 'package:flutter/material.dart';
import 'package:flutter_app/themes-styles/app_theme.dart';
import 'package:flutter_svg/svg.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.backgroundDecoration,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/widget-sup.svg',
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
