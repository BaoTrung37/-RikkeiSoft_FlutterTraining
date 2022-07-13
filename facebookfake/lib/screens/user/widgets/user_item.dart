import 'package:facebookfake/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.username,
    required this.avatar,
  }) : super(key: key);
  final String username;
  final String avatar;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 7,
            offset: const Offset(0, 5),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              minRadius: 20,
              backgroundImage: NetworkImage(avatar),
            ),
            const SizedBox(width: 10),
            Text(
              username,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextStyles.textMediumLight.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
