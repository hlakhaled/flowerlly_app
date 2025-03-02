import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUser({required String name, required String id}) {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  return users
      .doc(id)
      .set({
        "Name": name,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
