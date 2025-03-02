import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerlly_app/core/utils/functions/shared_preference_func.dart';

import 'package:flutter/material.dart';

login(
    {required String emailAddress,
    required String password,
    required BuildContext context}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);

    await SharedPreferenceFunc.setId(credential.user!.uid);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      const SnackBar(content: Text('No user found for that email.'));
    } else if (e.code == 'wrong-password') {
      const SnackBar(content: Text('Wrong password provided for that user.'));
    }
  }
}
