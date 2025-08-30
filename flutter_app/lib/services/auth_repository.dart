// lib/features/auth/data/auth_repository.dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> register(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleError(e.code);
    }
  }

  static String _handleError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email déjà utilisé';
      case 'weak-password':
        return 'Mot de passe trop faible';
      default:
        return 'Erreur lors de l\'inscription';
    }
  }
}
