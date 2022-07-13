import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final String id;
  final String postId;
  final DateTime dateCreated;
  final String content;
  final String ownerId;

  Comment({
    required this.id,
    required this.postId,
    required this.dateCreated,
    required this.content,
    required this.ownerId,
  });
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
