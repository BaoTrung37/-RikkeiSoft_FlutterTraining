import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../resources/firestore_constants.dart';

class ChatInfo {
  final String idFrom;
  final String idTo;
  final String lastMessage;
  final String timestamp;

  ChatInfo({
    required this.idFrom,
    required this.idTo,
    required this.lastMessage,
    required this.timestamp,
  });

  factory ChatInfo.formDocument(DocumentSnapshot snapshot) {
    String idFrom = "";
    String idTo = "";
    String lastMessage = "";
    String timestamp = "";
    try {
      idFrom = snapshot.get(FirestoreConstants.idFrom);
      idTo = snapshot.get(FirestoreConstants.idTo);
      lastMessage = snapshot.get(FirestoreConstants.lastMessage);
      timestamp = snapshot.get(FirestoreConstants.timestamp);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return ChatInfo(
      idFrom: idFrom,
      idTo: idTo,
      lastMessage: lastMessage,
      timestamp: timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.idFrom: idFrom,
      FirestoreConstants.idTo: idTo,
      FirestoreConstants.timestamp: timestamp,
      FirestoreConstants.lastMessage: lastMessage,
    };
  }
}
