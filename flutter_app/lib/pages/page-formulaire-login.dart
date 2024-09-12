import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/pages/page-home.dart';
import 'package:flutter_app/themes-styles/app-theme.dart';
import 'package:flutter_app/widgets/widget-alls-create.dart';
import 'package:flutter_app/pages/page-formulaire-register.dart';
import 'package:flutter_app/widgets/widget-formulaire-login.dart';
import 'package:flutter_app/fonctions_util/all-fonctions-util.dart';
import 'package:flutter_app/services/authentification_service.dart';

class WidgetFormulaireLogin extends StatefulWidget {
  @override
  _WidgetFormulaireLoginState createState() => _WidgetFormulaireLoginState();
}

class _WidgetFormulaireLoginState extends State<WidgetFormulaireLogin> {
  bool _obscurePassword = true;
  final AuthService _auth = AuthService(); // Instancier AuthService
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity, // permet de prendre toute la hauteur
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                        height:
                            30), // Espace pour que le contenu commence après le SVG
                    builderTitle(titleText: 'Bienvenue \nDans To-Do App'),
                    SizedBox(height: 30),
                    builderSubtitle(
                      subtitleText1: 'Login',
                      subtitleText2: 'Connectez-vous pour continuer',
                    ),
                    SizedBox(height: 20),
                    Form(
                      child: buildFormLogin(
                        obscurePassword: _obscurePassword,
                        onPasswordToggle: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                    ),
                    SizedBox(height: 25),
                    builderLoginButton(
                      buttonText: 'Login',
                      onPressed: () async {
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        User? user =
                            await _auth.signInWithEmail(email, password);

                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        } else {
                          setState(() {
                            error =
                                'Erreur de connexion. Veuillez vérifier vos informations.';
                          });
                        }
                        // Action de connexion
                      },
                    ),
                    SizedBox(height: 16),
                    builderForgotPasswordButton(
                      onPressed: () {
                        // Action pour mot de passe oublié
                      },
                    ),
                    SizedBox(height: 16),
                    builderDividerWithText('Ou continuez avec'),
                    SizedBox(height: 16),
                    SocialButtons(),
                    SizedBox(height: 16),
                    Center(
                      child: buildTextWithLink(
                        context: context,
                        staticText: "Vous n'avez pas un compte? ",
                        clickableText: 'Créer un compte',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WidgetFormulaireRegister(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                        height:
                            20), // Espace supplémentaire pour éviter que le contenu soit coupé
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              child: builderBackButton(
                context,
                iconColor: Color.fromARGB(255, 5, 5, 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
