import 'package:facebookfake/models/user.dart';
import 'package:facebookfake/screens/user/widgets/user_item.dart';
import 'package:flutter/material.dart';

import '../../dio/dio_client.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final DioClient _client = DioClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Screen')),
      body: _buildBody(_client),
    );
  }
}

Widget _buildBody(DioClient client) {
  return Center(
    child: FutureBuilder<List<User>>(
      future: client.fetchListUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('List empty'),
          );
        }
        final List<User> users = snapshot.data ?? [];
        return SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return UserItem(
                avatar: users[index].avatar,
                username: users[index].username,
              );
            },
            itemCount: users.length,
          ),
        );
      },
    ),
  );
}
