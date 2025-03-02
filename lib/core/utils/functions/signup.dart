import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerlly_app/core/utils/functions/add_users.dart';
import 'package:flowerlly_app/core/utils/functions/shared_preference_func.dart';
import 'package:flowerlly_app/core/utils/functions/snack_bar.dart';
import 'package:flowerlly_app/features/bottom_nav_bar/presentation/bottom_nav_bar.dart';
import 'package:flowerlly_app/features/regesteration/data/models/user_auth.dart';
import 'package:flutter/material.dart';

signup({required UserAuth user, required BuildContext context}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    String id = credential.user!.uid;
    SharedPreferenceFunc.setId(id);
    addUser(name: user.fullName, id: id);
    Navigator.pop(context);
    Navigator.popAndPushNamed(context, BottomNavBar.id);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showInSnackBar('The password provided is too weak.', context);
    } else if (e.code == 'email-already-in-use') {
      showInSnackBar('The account already exists for that email.', context);
    }
  } catch (e) {
    showInSnackBar('There is an error.', context);
  }
}
