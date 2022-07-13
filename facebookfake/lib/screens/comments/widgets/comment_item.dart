import 'package:facebookfake/resources/app_text_styles.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            minRadius: 20,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'BaoTrung',
                    style: AppTextStyles.textMedium,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Đẹp nha',
                    style: AppTextStyles.textMediumLight,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Text('15p trước'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
