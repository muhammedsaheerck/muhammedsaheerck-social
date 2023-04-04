import 'package:firebase_auth/firebase_auth.dart';

class AuthFire {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // User? get currentUser => firebaseAuth.currentUser;
  // Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<void> signIn({required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUser(
      {required String email, required String password}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  //google signin
  // final googleSignin = GoogleSignIn();
  // GoogleSignInAccount? _user;
  // GoogleSignInAccount get user => _user!;
  // Future googleLogin() async {
  //   final googleUser = await googleSignin.signIn();
  //   if (googleUser == null) {
  //     return;
  //   }
  //   _user = googleUser;

  //   final googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
