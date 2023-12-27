import 'package:firebase_auth/firebase_auth.dart';
String? password;
String? email;
Future<UserCredential> userRegister() async {
  var auth = FirebaseAuth.instance;

  UserCredential user = await auth.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
  return user;
}

Future<UserCredential> userLogin() async {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!
  );
  return credential;
}
