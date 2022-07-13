// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Like _$LikeFromJson(Map<String, dynamic> json) => Like(
      id: json['id'] as int,
      postId: json['postId'] as int,
      ownerId: json['ownerId'] as int,
    );

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'ownerId': instance.ownerId,
    };
