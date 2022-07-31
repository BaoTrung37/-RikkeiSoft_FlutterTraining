import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/firestore_constants.dart';

class HomeProvider {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getUserList() {
    return fireStore
        .collection(FirestoreConstants.pathUserCollection)
        .snapshots();
  }
}
