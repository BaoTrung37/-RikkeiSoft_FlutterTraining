import 'package:app_chat/domain/pages/chat_room/widgets/image_item.dart';
import 'package:flutter/material.dart';

import 'package:app_chat/models/chat_info.dart';
import 'package:app_chat/resources/app_colors.dart';
import 'package:app_chat/resources/app_text_styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.chatInfo,
    required this.isMe,
  }) : super(key: key);
  final ChatInfo chatInfo;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: isMe ? AppColors.primaryColor : AppColors.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft:
                    isMe ? const Radius.circular(12) : const Radius.circular(0),
                bottomRight: !isMe
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
              ),
            ),
            child: chatInfo.type == ChatType.text.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 12,
                    ),
                    child: Text(
                      chatInfo.lastMessage,
                      style: AppTextStyles.textXSmallLight.copyWith(
                        color: isMe
                            ? AppColors.textSecondary
                            : AppColors.textPrimary,
                      ),
                    ),
                  )
                : ImageItem(
                    imageUrl: chatInfo.lastMessage,
                    onTap: () {},
                  ),
          ),
        ],
      ),
    );
  }
}
