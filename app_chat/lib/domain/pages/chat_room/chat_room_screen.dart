import 'dart:io';

import 'package:app_chat/domain/pages/chat_room/widgets/chat_item.dart';
import 'package:app_chat/models/chat_info.dart';
import 'package:app_chat/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'package:app_chat/provider/auth_provider.dart';
import 'package:app_chat/provider/chat_provider.dart';
import 'package:app_chat/resources/app_texts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../../util/navigation_service.dart';
import 'widgets/form_send.dart';

class ChatRoomScreen extends ConsumerStatefulWidget {
  final User userRev;
  const ChatRoomScreen({
    required this.userRev,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends ConsumerState<ChatRoomScreen> {
  String message = '';
  String groupId = '';
  String currentId = '';
  String imageUrl = '';
  File? imageFile;

  var _limit = 20;
  final int _limitIncrement = 20;

  final chatProvider = GetIt.I.get<ChatProvider>();
  final authProvider = GetIt.I.get<AuthProvider>();

  final ScrollController scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    currentId = authProvider.user.uid;
    scrollController.addListener(_scrollListener);
    if (currentId.compareTo(widget.userRev.id) > 0) {
      groupId = '$currentId-${widget.userRev.id}';
    } else {
      groupId = '${widget.userRev.id}-$currentId';
    }
    super.initState();
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      uploadImageFile();
    }
  }

  Future uploadImageFile() async {
    String filename = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = chatProvider.upLoadImageFile(imageFile!, filename);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      onSend(imageUrl, ChatType.image.value);
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  void onSend(String message, int type) {
    if (message.isNotEmpty) {
      chatProvider.sendMessage(
          message, type, groupId, currentId, widget.userRev.id);
      _textController.text = '';
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
            stream: chatProvider.getChatMessage(groupId, _limit),
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
            onTabSend: () => onSend(_textController.text, ChatType.text.value),
            onChanged: (value) {
              message = _textController.text;
            },
            onTabImage: getImage,
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBarTitle() {
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
          CircleAvatar(
            minRadius: 18,
            backgroundImage: NetworkImage(
              widget.userRev.avatar,
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
                    widget.userRev.username,
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
