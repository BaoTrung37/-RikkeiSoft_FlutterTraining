import 'package:app_chat/domain/pages/chat_room/widgets/chat_item.dart';
import 'package:app_chat/models/chat_info.dart';
import 'package:app_chat/models/user.dart';
import 'package:app_chat/resources/app_texts.dart';
import 'package:app_chat/provider/fireauth_provider.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarTitle(),
      body: Column(
        children: [
          
          
        ],
      ),
    );
  }

  AppBar _buildAppBarTitle() {
    final FireauthProvider auth = FireauthProvider();

    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.iconSecondary,
        ),
        onPressed: () {
          // Todo: Implement search
        },
      ),
      title: Row(
        children: [
          const CircleAvatar(
            minRadius: 18,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300',
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    auth.user.displayName ?? 'User12345',
                    style: AppTextStyles.textSmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppTexts.onlineNow,
                    style: AppTextStyles.textXXSmallLight.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      titleTextStyle: AppTextStyles.labelSmall.copyWith(
        color: AppColors.textPrimary,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.videocam,
            color: AppColors.iconSecondary,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone,
            color: AppColors.iconSecondary,
          ),
        ),
      ],
    );
  }
}
