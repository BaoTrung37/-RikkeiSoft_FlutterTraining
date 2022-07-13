// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      caption: json['caption'] as String,
      image: json['image'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      totalComment: json['totalComment'] as int,
      totalLike: json['totalLike'] as int,
      ownerId: json['ownerId'] as int,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'image': instance.image,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'totalComment': instance.totalComment,
      'totalLike': instance.totalLike,
      'ownerId': instance.ownerId,
      'username': instance.username,
      'avatar': instance.avatar,
    };
