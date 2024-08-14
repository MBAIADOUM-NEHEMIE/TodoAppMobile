import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all-fonctions-util.dart';
import 'package:flutter_app/pages/page-formulaire-register.dart';
import 'package:flutter_app/pages/page-home.dart';
import 'package:flutter_app/themes-styles/app-theme.dart';
import 'package:flutter_app/widgets/widget-button-social.dart';
import 'package:flutter_app/widgets/widget-formulaire-login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetFormulaireLogin extends StatefulWidget {
  @override
  _WidgetFormulaireLoginState createState() => _WidgetFormulaireLoginState();
}

class _WidgetFormulaireLoginState extends State<WidgetFormulaireLogin> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/widget-sup.svg',
              width: double.infinity,
              height: 400,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        ),
                      ),
                      SizedBox(height: 25),
                      builderLoginButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                          // Action de connexion
                        },
                        buttonText: 'Login',
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
                                builder: (context) =>
                                    WidgetFormulaireRegister(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: builderBackButton(context,
                        iconColor: Color.fromARGB(255, 5, 5, 5)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
