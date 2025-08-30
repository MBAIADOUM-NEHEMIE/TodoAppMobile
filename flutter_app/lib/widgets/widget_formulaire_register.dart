import 'package:flutter/material.dart';
import 'package:flutter_app/fonctions_util/all_fonctions_util.dart';
import 'package:flutter_app/services/register_controller.dart';
import 'package:flutter_app/widgets/widget_alls_create.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(); // Clé pour le formulaire
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister(BuildContext context) async {
    final controller = context.read<RegisterController>();
    try {
      await controller.register(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        confirmPassword: _confirmPasswordController.text.trim(),
      );
    } catch (e) {
      if (mounted) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFieldAvecIcon(
            controller: _emailController,
            icon: Icons.person,
            labelText: 'Nom et Prénom',
            hintText: 'Entrez votre nom complet',
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Veuillez entrer votre nom complet';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFieldAvecIcon(
            icon: Icons.email,
            labelText: 'Email',
            hintText: 'Entrez votre email',
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Veuillez entrer votre email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
                return 'Veuillez entrer un email valide';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFieldAvecIcon(
            icon: Icons.lock,
            labelText: 'Mot de passe',
            hintText: 'Créez un mot de passe',
            obscureText: true,
            validator: (val) {
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFieldAvecIcon(
            icon: Icons.lock_outline,
            labelText: 'Confirmez le mot de passe',
            hintText: 'Confirmez votre mot de passe',
            obscureText: true,
            validator: (val) {
              return null;
            },
          ),
          const SizedBox(height: 25),
          // ... autres champs
          builderLoginButton(
            buttonText: 'Valider',
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              await _handleRegister(context);
            },
            isLoading: controller.isLoading,
          ),
        ],
      ),
    );
  }
}
