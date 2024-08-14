import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all-fonctions-util.dart';
import 'package:flutter_app/themes-styles/app-theme.dart';
import 'package:flutter_app/widgets/widget-button-social.dart';
import 'package:flutter_app/widgets/widget-formulaire-register.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetFormulaireRegister extends StatefulWidget {
  @override
  _WidgetFormulaireRegisterState createState() =>
      _WidgetFormulaireRegisterState();
}

class _WidgetFormulaireRegisterState extends State<WidgetFormulaireRegister> {
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
              padding: const EdgeInsets.all(18.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      builderTitle(titleText: 'Bienvenue \nDans To-Do App'),
                      SizedBox(height: 20),
                      builderSubtitle(
                        subtitleText1: 'Register',
                        subtitleText2: 'Enregistrez-vous pour continuer',
                      ),
                      SizedBox(height: 20),
                      Form(
                        child: buildFormRegister(
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
                          // Action de connexion
                        },
                        buttonText: 'Valider',
                      ),

                      SizedBox(height: 16),
                      builderDividerWithText('Ou continuez avec'),
                      SizedBox(height: 16),
                      SocialButtons(), // Appel fonction
                      SizedBox(height: 16),
                      Center(
                        child: buildTextWithLink(
                          context: context,
                          staticText: "Vous avez déjà un compte? ",
                          clickableText: 'Connectez-vous',
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
                        iconColor: const Color.fromARGB(255, 8, 8, 8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
