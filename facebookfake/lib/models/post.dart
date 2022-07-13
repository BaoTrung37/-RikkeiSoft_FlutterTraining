import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final String caption;
  final String image;
  final DateTime dateCreated;
  final int totalComment;
  final int totalLike;
  final int ownerId;
  final String username;
  final String avatar;
  Post({
    required this.id,
    required this.caption,
    required this.image,
    required this.dateCreated,
    required this.totalComment,
    required this.totalLike,
    required this.ownerId,
    required this.username,
    required this.avatar,
  });
  
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
