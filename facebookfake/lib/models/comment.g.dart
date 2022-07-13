// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String,
      postId: json['postId'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      content: json['content'] as String,
      ownerId: json['ownerId'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'content': instance.content,
      'ownerId': instance.ownerId,
    };
