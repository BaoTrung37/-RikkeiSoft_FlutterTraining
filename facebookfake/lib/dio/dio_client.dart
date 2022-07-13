import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:facebookfake/models/post.dart';

import '../models/user.dart';

class DioClient {
  final Dio _dio = Dio();

  final String baseUrl = 'https://mockend.com/baotrung37/fake_api';

  Future<List<User>> fetchListUser() async {
    final response = await _dio.get('$baseUrl/user');
    final data = jsonDecode(response.data);
    // print(data);
    return data.map<User>((item) {
      return User.fromJson(item);
    }).toList();
  }

  Future<List<Post>> fetchListPost() async {
    final response = await _dio.get('$baseUrl/post');
    // print(response.data.runtimeType);
    final data = jsonDecode(response.data);

    print(data.length);

    // List<Post> posts = data.map<Post>((item) async {
    //   return await fetchPostWithId(item['id']);
    // }).toList();
    List<Post> posts = [];
    // data.forEach((item) async {
    //   Post post = await fetchPostWithId(item['id']);
    //   posts.add(post);
    //   print("posts: ${posts.length}");
    // });
    for(int i = 0; i < posts.length; i++) {
      final item = data[i];
      Post post = await fetchPostWithId(item['id']);
      posts.add(post);
      print("posts: ${posts.length}");
    }

    return posts;
  }

  Future<Post> fetchPostWithId(int id) async {
    final response = await _dio.get('$baseUrl/post/$id');
    final data = jsonDecode(response.data);

    final totalComments = await getTotalCommentPost(id);
    print("totalComments: $totalComments");
    final totalLikes = await getTotalLikePost(id);
    print("totalLikes: $totalLikes");
    final user = await fetchUserWithId(data['ownerId']);
    print("user: ${user.username}");

    return Post(
      id: data['id'],
      caption: data['caption'],
      image: data['image'],
      dateCreated: DateTime.parse(data['dateCreated']),
      totalComment: totalComments,
      totalLike: totalLikes,
      ownerId: data['ownerId'],
      username: user.username ,
      avatar: user.avatar,
    );
  }

  Future<User> fetchUserWithId(int id) async {
    final response = await _dio.get('$baseUrl/user/$id');
    final data = jsonDecode(response.data);
    if(data == null) {
      return User(id: 123,avatar: "aaa",username: "bbb");
    }
    return User.fromJson(data);
  }

  Future<int> getTotalLikePost(int postId) async {
    final response =
        await _dio.get('$baseUrl/like', queryParameters: {'postId': postId});
    final data = jsonDecode(response.data);
    return data != null ? data.length : 0;
  }

  Future<int> getTotalCommentPost(int postId) async {
    final response =
        await _dio.get('$baseUrl/comment', queryParameters: {'postId': postId});
    final data = jsonDecode(response.data);
    return data != null ? data.length : 0;
  }
}
