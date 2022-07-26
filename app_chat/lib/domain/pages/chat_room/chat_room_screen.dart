import 'package:app_chat/domain/pages/chat_room/widgets/chat_item.dart';
import 'package:app_chat/models/chat_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'package:app_chat/provider/fireauth_provider.dart';
import 'package:app_chat/provider/firestore_provider.dart';
import 'package:app_chat/resources/app_texts.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../../util/navigation_service.dart';
import 'widgets/form_send.dart';

final storeProvider = Provider<FireStoreProvider>(
  (ref) => GetIt.I.get<FireStoreProvider>(),
);

final authProvider = Provider<FireauthProvider>(
  (ref) => GetIt.I.get<FireauthProvider>(),
);

class ChatRoomScreen extends ConsumerStatefulWidget {
  final String toId;
  const ChatRoomScreen({
    required this.toId,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends ConsumerState<ChatRoomScreen> {
  String message = '';
  String groupId = '';
  String currentId = '';
  var _limit = 20;
  final int _limitIncrement = 20;

  final ScrollController scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    currentId = ref.read(authProvider).user.uid;
    scrollController.addListener(_scrollListener);
    if (currentId.compareTo(widget.toId) > 0) {
      groupId = '$currentId-${widget.toId}';
    } else {
      groupId = '${widget.toId}-$currentId';
    }
    super.initState();
  }

  void onSend() {
    print('send');
    if (message.isNotEmpty) {
      ref
          .watch(storeProvider)
          .sendMessage(message, groupId, currentId, widget.toId);
      // setText('');
      _textController.clear();
    }
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBarTitle(),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: ref.watch(storeProvider).getChatMessage(groupId, _limit),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if ((snapshot.data?.docs.length ?? 0) > 0) {
                  return Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemBuilder: (context, index) =>
                          _buildChatItem(context, snapshot.data?.docs[index]),
                      itemCount: snapshot.data!.docs.length,
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: Text('No message ..'),
                    ),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FormSend(
            controller: _textController,
            onTap: onSend,
            onChanged: (value) {
              setState(() {
                _textController.text = value!;
                message = _textController.text;
              });
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBarTitle() {
    final FireauthProvider auth = FireauthProvider();
    return AppBar(
      elevation: 1,
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.iconSecondary,
        ),
        onPressed: () {
          // Todo: Implement
          GetIt.I.get<NavigationSerivce>().back();
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

  Widget _buildChatItem(
      BuildContext context, DocumentSnapshot? documentSnapshot) {
    if (documentSnapshot != null) {
      ChatInfo chatInfo = ChatInfo.formDocument(documentSnapshot);
      return ChatItem(
        chatInfo: chatInfo,
        isMe: (chatInfo.idFrom == currentId) ? true : false,
      );
    }
    return Container();
  }
}
