import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_chat/resources/firestore_constants.dart';

class FireStoreProvider {
  final FirebaseFirestore fireStore;
  FireStoreProvider({
    required this.fireStore,
  });

  Stream<QuerySnapshot> getUserList() {
    return fireStore
        .collection(FirestoreConstants.pathUserCollection)
        .snapshots();
  }
}
