import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/authentification_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/pages/page_home.dart';
import 'package:flutter_app/themes-styles/app_theme.dart';
import 'package:flutter_app/widgets/widget_alls_create.dart';
import 'package:flutter_app/pages/page_formulaire_register.dart';
import 'package:flutter_app/widgets/widget_formulaire_login.dart';
import 'package:flutter_app/fonctions_util/all_fonctions_util.dart';
// import 'package:flutter_app/services/authentification_service.dart';

class WidgetFormulaireLogin extends StatefulWidget {
  const WidgetFormulaireLogin({super.key});

  @override
  WidgetFormulaireLoginState createState() => WidgetFormulaireLoginState();
}

class WidgetFormulaireLoginState extends State<WidgetFormulaireLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  String _errorMessage = '';

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  Future<void> _submitForm() async {
    setState(() => _isLoading = true);
    try {
      //  Validation des entrées
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        throw 'Veuillez remplir tous les champs';
      }

      setState(() => _isLoading = true);

      // Appel au service d'authentification
      final user = await AuthService.loginUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Vérification supplémentaire
      if (user == null) throw 'Échec de la connexion';

      // Navigation sécurisée vèrs une autre page (la home page)
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = AuthService.translateAuthError(e.code));
    } on String catch (e) {
      // Capture des erreurs personnalisées
      setState(() => _errorMessage = e);
    } catch (e) {
      setState(() => _errorMessage = 'Erreur inattendue');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

// Construction de la vue 
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
                'assets/images/widget-sup.svg', // Image du background 
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
                    const SizedBox(
                        height:
                            30), // Espace pour que le contenu commence après le SVG
                    builderTitle(titleText: 'Bienvenue \nDans To-Do App'),
                    const SizedBox(height: 30),
                    builderSubtitle(
                      subtitleText1: 'Login',
                      subtitleText2: 'Connectez-vous pour continuer',
                    ),
                    const SizedBox(height: 20),

                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),

                    Form(
                      child: // Utilisation du widget réutilisable ( Le formulaire )
                          buildFormLogin(
                        obscurePassword: _obscurePassword,
                        onPasswordToggle: _togglePasswordVisibility,
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                    ),
                    const SizedBox(height: 25),
                    builderLoginButton(
                      buttonText: 'Login',
                      onPressed:
                          _submitForm, // Appel de la fonction asynchrone
                      isLoading: _isLoading,
                    ),
                    const SizedBox(height: 16),
                    builderForgotPasswordButton(
                      onPressed: () {
                        // Action pour mot de passe oublié à implementer
                      },
                    ),
                    const SizedBox(height: 16),
                    builderDividerWithText('Ou continuez avec'),
                    const SizedBox(height: 16),
                    const SocialButtons(),
                    const SizedBox(height: 16),
                    Center(
                      child: buildTextWithLink(
                        context: context,
                        staticText: "Vous n'avez pas un compte? ",
                        clickableText: 'Créer un compte',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
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
                iconColor: const Color.fromARGB(255, 5, 5, 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
