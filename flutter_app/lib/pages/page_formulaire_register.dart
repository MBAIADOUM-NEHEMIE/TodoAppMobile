// lib/features/auth/presentation/pages/register_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all_fonctions_util.dart';
import 'package:flutter_app/pages/page_formulaire_login.dart';
import 'package:flutter_app/screens/view_auth_layout_screen.dart';
import 'package:flutter_app/services/auth_repository.dart';
import 'package:flutter_app/services/register_controller.dart';
import 'package:flutter_app/widgets/widget_formulaire_register.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterController(AuthRepository()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: AuthLayout(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const SizedBox(height: 20),
                builderTitle(titleText: 'Bienvenue \nDans To-Do App'),
                const SizedBox(height: 20),
                builderSubtitle(
                  subtitleText1: 'Register',
                  subtitleText2: 'Enregistrez-vous pour continuer',
                ),
                const SizedBox(height: 20),
                const RegisterForm(),
                const SizedBox(height: 16),
                _buildLoginLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Center(
      child: buildTextWithLink(
        context: context,
        staticText: "Vous avez déjà un compte? ",
        clickableText: 'Connectez-vous',
        onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WidgetFormulaireLogin()),
        ),
      ),
    );
  }
}
