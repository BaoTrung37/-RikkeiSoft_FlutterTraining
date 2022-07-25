import 'package:app_chat/resources/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String avatar;
  final String? aboutMe;

  const User({
    required this.id,
    required this.username,
    required this.avatar,
    this.aboutMe,
  });

  User copyWith({
    String? id,
    String? username,
    String? avatar,
    String? aboutMe,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      aboutMe: aboutMe ?? this.aboutMe,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'avatar': avatar,
      'aboutMe': aboutMe,
    };
  }

  factory User.formDocument(DocumentSnapshot snapshot) {
    String username = "";
    String avatar = "";
    String? aboutMe = "";
    try {
      username = snapshot.get(FirestoreConstants.username);
      avatar = snapshot.get(FirestoreConstants.avatar);
      aboutMe = snapshot.get(FirestoreConstants.aboutMe);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return User(
      id: snapshot.id,
      username: username,
      avatar: avatar,
      aboutMe: aboutMe,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, username, avatar, aboutMe];
}
