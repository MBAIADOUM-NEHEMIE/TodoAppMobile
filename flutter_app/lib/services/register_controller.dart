// lib/features/auth/domain/register_controller.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_app/services/auth_repository.dart';

class RegisterController extends ChangeNotifier {
  final AuthRepository _repo;
  bool isLoading = false;
  String? error;

  RegisterController(this._repo);

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      error = 'Les mots de passe ne correspondent pas';
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      await _repo.register(email, password);
      error = null;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
