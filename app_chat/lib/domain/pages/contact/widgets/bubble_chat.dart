import 'package:flutter/material.dart';

import 'package:app_chat/models/user.dart';
import 'package:app_chat/resources/app_colors.dart';

import '../../../../resources/app_text_styles.dart';

class BubbleChat extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  const BubbleChat({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: _buildAvatar(),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildUsernameView(),
                    const SizedBox(height: 4),
                    _buildMessageRev(),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 4),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 23,
                horizontal: 15,
              ),
              child: Column(
                children: [
                  _buildTimestampLastMessage(),
                  const SizedBox(height: 4),
                  _buildUnreadMessagesCount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnreadMessagesCount() {
    return CircleAvatar(
      minRadius: 8,
      backgroundColor: AppColors.primaryColor,
      child: Text(
        '1',
        style: AppTextStyles.textXXSmal.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildTimestampLastMessage() {
    return Text(
      '2 phút trước',
      style: AppTextStyles.textXSmallLight.copyWith(
        color: AppColors.textGrey,
      ),
    );
  }

  Widget _buildMessageRev() {
    return Text(
      'Bạn có tin nhắn mới',
      style: AppTextStyles.textXXSmallLight.copyWith(
        color: AppColors.textTertiary,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildUsernameView() {
    return Text(
      user.username,
      style: AppTextStyles.textSmall.copyWith(
        color: AppColors.textPrimary,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      minRadius: 21,
      backgroundImage: NetworkImage(user.avatar),
    );
  }
}
