import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class Like {
  final int id;
  final int postId;
  final int ownerId;
  Like({
    required this.id,
    required this.postId,
    required this.ownerId,
  });
  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
  Map<String, dynamic> toJson() => _$LikeToJson(this);
}
