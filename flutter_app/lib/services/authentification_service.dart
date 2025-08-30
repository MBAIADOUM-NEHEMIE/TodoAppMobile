// lib/services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e.code); // Utilisation de votre méthode existante
    }
  }

  // Déclarez la méthode comme publique pour la réutiliser ailleurs
  static String translateAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Email non enregistré';
      case 'wrong-password':
        return 'Mot de passe incorrect';
      case 'invalid-email':
        return 'Format email invalide';
      case 'user-disabled':
        return 'Compte désactivé';
      case 'too-many-requests':
        return 'Trop de tentatives. Réessayez plus tard';
      case 'operation-not-allowed':
        return 'Méthode de connexion désactivée';
      default:
        return 'Erreur de connexion (Code: $code)'; // Ajout du code pour le débogage
    }
  }

  // Alias pour la compatibilité (gardez l'ancien nom si utilisé ailleurs)
  static String _handleAuthError(String code) => translateAuthError(code);

  // Ajoutez d'autres méthodes ici

  // lib/services/auth_service.dart
  static Future<User?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw translateAuthError(
          e.code); // Réutilise la même traduction d'erreurs
    }
  }
}
