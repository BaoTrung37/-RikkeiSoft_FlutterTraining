import 'dart:io';

import 'package:app_chat/models/chat_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_chat/resources/firestore_constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/user.dart';

class ChatProvider {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseStorage fireStorage = FirebaseStorage.instance;

  Future<User> getUser(String userId) {
    return fireStore
        .collection(FirestoreConstants.pathUserCollection)
        .doc(userId)
        .get()
        .then((value) {
      return User.formDocument(value);
    });
  }

  UploadTask upLoadImageFile(File image, String filename) {
    Reference reference = fireStorage.ref().child(filename);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
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

  void sendMessage(String lastMessage, int type, String groupId, String idFrom,
      String idTo) {
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
      type: type, 
    );

    fireStore.runTransaction(
      (transaction) async => transaction.set(
        documentReference,
        chatInfo.toJson(),
      ),
    );
  }
}
