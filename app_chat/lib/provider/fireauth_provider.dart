import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireauthProvider {
  late final FirebaseAuth fireAuth = FirebaseAuth.instance;
  
  User get user => fireAuth.currentUser!;

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await fireAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // print(userCrendential.user!.email);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await fireAuth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    return await fireAuth.signOut();
  }
}
