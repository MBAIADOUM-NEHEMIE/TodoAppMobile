// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Connexion avec email et mot de passe
//   Future<User?> signInWithEmail(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return result.user;
//     } catch (e) {
//       print('Erreur lors de la connexion : ${e.toString()}');
//       return null;
//     }
//   }

//   // Inscription avec email et mot de passe
//   Future<User?> registerWithEmail(
//       String userName, String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = result.user;

//       // Ajouter le nom dans Firestore
//       if (user != null) {
//         await _firestore.collection('users').doc(user.uid).set({
//           'userName': userName,
//           'email': email,
//         });
//       }
//       return user;
//     } catch (e) {
//       print('Erreur lors de l\'inscription : ${e.toString()}');
//       return null;
//     }
//   }

//   // Déconnexion
//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       print('Erreur lors de la déconnexion : ${e.toString()}');
//     }
//   }

//   // Réinitialiser le mot de passe
//   Future<void> resetPassword(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } catch (e) {
//       print(
//           'Erreur lors de la réinitialisation du mot de passe : ${e.toString()}');
//     }
//   }
// }
