import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = StreamProvider((ref) {
  return FirebaseFirestore.instance
      .collection("messages")
      .orderBy("time", descending: true)
      .snapshots();
});
