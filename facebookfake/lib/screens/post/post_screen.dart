import 'package:flutter/material.dart';

import '../../dio/dio_client.dart';
import '../../models/post.dart';
import 'widgets/post_item.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final DioClient client = DioClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Screen')),
      body: Center(
        child: FutureBuilder<List<Post>>(
            future: client.fetchListPost(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('List empty'),
                );
              }
              final List<Post> posts = snapshot.data ?? [];
              print(posts.length);
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PostItem(
                      post: posts[index],
                    );
                  },
                  itemCount: posts.length,
                ),
              );
            }),
      ),
    );
  }
}
