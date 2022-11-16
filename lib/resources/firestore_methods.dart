import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();

  void addMeetingToHistory(String meetingName) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      log("Erro ${e}");
    }
  }
}
