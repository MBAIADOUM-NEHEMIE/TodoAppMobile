import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/themes-styles/app-style.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class WidgetSuperieur extends StatelessWidget {
  // Déclaration des variables

  final String? svgImagePath; // Chemin de l'image SVG
  final String? pngImagePath; // Chemin de l'image PNG
  // final String appBarTitle; // Titre de l'AppBar

  // Initialisation du constructeur
  const WidgetSuperieur({
    this.svgImagePath,
    this.pngImagePath,
    // this.appBarTitle = 'To-Do App', // Valeur par défaut
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Première image en bas, affichée seulement si svgImagePath n'est pas null
        if (svgImagePath != null)
          SvgPicture.asset(
            svgImagePath!,
            width: double.infinity,
            height: 400,
          ),
        // AppBar(
        //   title: Text(appBarTitle),
        // ),
        // Deuxième image au-dessus de la première, affichée seulement si pngImagePath n'est pas null
        if (pngImagePath != null)
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              pngImagePath!,
              width: double.infinity,
              height: 400,
            ),
          ),
      ],
    );
  }
}

class SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                // final GoogleSignInAccount? googleUser =
                //     await GoogleSignIn().signIn();
                // if (googleUser != null) {
                //   String name = googleUser.displayName ?? '';
                //   String email = googleUser.email;
                //   print('Nom: $name, Email: $email');
                // }
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
              onPressed: () async {
                // final LoginResult result = await FacebookAuth.instance.login();
                // if (result.status == LoginStatus.success) {
                //   final userData = await FacebookAuth.instance.getUserData();
                //   String name = userData['name'];
                //   String email = userData['email'];
                //   // Utilisez ces informations dans l'application
                //   print('Nom: $name, Email: $email');
                // }
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

class TextFieldAvecIcon extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const TextFieldAvecIcon({
    required this.icon,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
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
          controller: controller,
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

// priority_selector.dart

class PrioritySelector extends StatelessWidget {
  final String? selectedPriority;
  final ValueChanged<String> onPrioritySelected;

  PrioritySelector(
      {required this.selectedPriority, required this.onPrioritySelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      child: Container(
        width: double.infinity,
        child: Text(
          selectedPriority == null ? 'Priorité' : 'Priorité: $selectedPriority',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      onSelected: onPrioritySelected,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'basse',
          child: Row(
            children: [
              Icon(Icons.flag, color: Colors.green),
              SizedBox(width: 8.0),
              Text('Basse'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'moyenne',
          child: Row(
            children: [
              Icon(Icons.flag, color: Colors.yellow),
              SizedBox(width: 8.0),
              Text('Moyenne'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'haute',
          child: Row(
            children: [
              Icon(Icons.flag, color: Colors.red),
              SizedBox(width: 8.0),
              Text('Haute'),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectIconDialog extends StatelessWidget {
  final Function(IconData) onIconSelected;

  SelectIconDialog({required this.onIconSelected});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.star,
      Icons.home,
      Icons.work,
      Icons.school,
      Icons.favorite,
      // Ajoutez d'autres icônes ici
    ];

    return AlertDialog(
      title: Text('Choisir une Icône'),
      content: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Nombre de colonnes dans la grille
          crossAxisSpacing: 8.0, // Espacement horizontal entre les icônes
          mainAxisSpacing: 8.0, // Espacement vertical entre les icônes
        ),
        itemCount: icons.length,
        itemBuilder: (context, index) {
          final icon = icons[index];
          return GestureDetector(
            onTap: () {
              onIconSelected(
                  icon); // Appelle la fonction de rappel avec l'icône sélectionnée
              Navigator.of(context).pop(); // Ferme le dialogue après sélection
            },
            child: Icon(
              icon,
              size: 40.0, // Taille des icônes
              color: Colors.blue, // Couleur des icônes
            ),
          );
        },
      ),
    );
  }
}
