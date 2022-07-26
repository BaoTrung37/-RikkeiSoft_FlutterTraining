import 'package:app_chat/models/chat_info.dart';
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

  Stream<QuerySnapshot> getChatMessage(String groupChatId, int limit) {
    return fireStore
        .collection(FirestoreConstants.pathChatsCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  void sendMessage(
      String lastMessage, String groupId, String idFrom, String idTo) {
    DocumentReference documentReference = fireStore
        .collection(FirestoreConstants.pathChatsCollection)
        .doc(groupId)
        .collection(groupId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    ChatInfo chatInfo = ChatInfo(
      idFrom: idFrom,
      idTo: idTo,
      lastMessage: lastMessage,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    fireStore.runTransaction((transaction) async => transaction.set(
          documentReference,
          chatInfo.toJson(),
        ));
  }
}
