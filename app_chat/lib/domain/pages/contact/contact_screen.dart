import 'package:app_chat/domain/pages/contact/widgets/bubble_chat.dart';
import 'package:app_chat/provider/fireauth_provider.dart';
import 'package:app_chat/provider/firestore_provider.dart';
import 'package:app_chat/resources/app_colors.dart';
import 'package:app_chat/resources/app_text_styles.dart';
import 'package:app_chat/resources/app_texts.dart';
import 'package:app_chat/util/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../models/user.dart';
import '../../../util/navigation_service.dart';

final fireStoreProvider = Provider<FireStoreProvider>(
  (ref) => GetIt.I.get<FireStoreProvider>(),
);
final fireAuthProvider = Provider<FireauthProvider>(
  (ref) => FireauthProvider(),
);

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  late String currentUserId;
  @override
  void initState() {
    // TODO: implement initState
    currentUserId = ref.read(fireAuthProvider).user.uid;
    // print(ref.read(fireAuthProvider).user.displayName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final users = ref.watch(fireStoreProvider).getUserList();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: ref.watch(fireStoreProvider).getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if ((snapshot.data?.docs.length ?? 0) > 0) {
              return ListView.separated(
                  itemBuilder: (context, index) =>
                      _buildUserList(context, snapshot.data?.docs[index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!.docs.length);
            } else {
              return const Center(
                child: Text('No user ..'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildUserList(
      BuildContext context, DocumentSnapshot? documentSnapshot) {
    if (documentSnapshot != null) {
      User user = User.formDocument(documentSnapshot);
      if (user.id == currentUserId) {
        return Container();
      } else {
        return BubbleChat(
          user: user,
          onTap: () {
            GetIt.I.get<NavigationSerivce>().to(
                  routeName: Routes.chatRoomScreen,
                  arguments: user,
                );
          },
        );
      }
    } else {
      return Container();
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.search,
          color: AppColors.iconSecondary,
        ),
        onPressed: () {
          // Todo: Implement search
        },
      ),
      automaticallyImplyLeading: false,
      titleTextStyle: AppTextStyles.labelSmall.copyWith(
        color: AppColors.textPrimary,
      ),
      title: const Text(
        AppTexts.contactAppBarTitle,
      ),
      actions: const [
        CircleAvatar(
          minRadius: 18,
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/300',
          ),
        )
      ],
    );
  }
}
