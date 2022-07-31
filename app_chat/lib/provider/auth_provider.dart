import 'package:app_chat/resources/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User get user => fireAuth.currentUser!;

  // String? getFirebaseUserId() =>

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await fireAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      User? firebaseUser =
          (await fireAuth.signInWithCredential(credential)).user;

      if (firebaseUser != null) {
        final QuerySnapshot result = await firestore
            .collection(FirestoreConstants.pathUserCollection)
            .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
            .get();
        final document = result.docs;
        if (document.isEmpty) {
          firestore
              .collection(FirestoreConstants.pathUserCollection)
              .doc(firebaseUser.uid)
              .set({
            FirestoreConstants.avatar: firebaseUser.photoURL,
            FirestoreConstants.username: firebaseUser.displayName,
          });
        }
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> signOut() async {
    await fireAuth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
}
