import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore userCreate = FirebaseFirestore.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  addUser(
      {required String userName, required String email, required int phone}) {
    return userCreate
        .collection("Users")
        .doc(currentUser!.uid)
        .set({"userName": userName, "email": email, "phone": phone});
  }

  final CollectionReference _users =
      FirebaseFirestore.instance.collection("Users");
  Future<void> upDate(
      {String? userName,
      String? email,
      String? location,
      int? phone,
      String? birthDate}) async {
    await _users.doc(currentUser!.uid).set({
      "userName": userName,
      "email": email,
      "location": location,
      "phone": phone,
      "birthDate": birthDate
    }, SetOptions(merge: true));
  }

  Future<void> delete() async {
    await _users.doc(currentUser!.uid).delete();
  }
}
