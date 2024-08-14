import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/themes-styles/app-style.dart';

class SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Action de connexion avec Google
              },
              style: AppButtonStyles.buttonNivau2.copyWith(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 240, 81, 60)),
                minimumSize: MaterialStateProperty.all(Size(60, 20)),
              ),
              icon: Icon(FontAwesomeIcons.google, color: Colors.white),
              label: Text('Google'),
            ),
            SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Action de connexion avec Facebook
              },
              style: AppButtonStyles.buttonNivau2.copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
                minimumSize: MaterialStateProperty.all(Size(60, 20)),
              ),
              icon: Icon(Icons.facebook, color: Colors.white),
              label: Text('Facebook'),
            ),
          ],
        ),
        SizedBox(height: 20), // Espace entre les boutons sociaux et le texte
      ],
    );
  }
}
