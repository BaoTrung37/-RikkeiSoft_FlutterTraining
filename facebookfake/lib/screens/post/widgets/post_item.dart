import 'package:flutter/material.dart';

import 'package:facebookfake/models/post.dart';
import 'package:facebookfake/resources/app_text_styles.dart';

import '../../comments/comments_screen.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 10),
          _buildCaption(),
          const SizedBox(height: 10),
          _buildImage(context),
          const SizedBox(height: 20),
          _builldInteractive(),
          const SizedBox(height: 10),
          _buildPostLike(),
          const SizedBox(height: 10),
          _buildPostTitle(),
          const SizedBox(height: 10),
          _buildNumberOfComments(context),
          const SizedBox(height: 10),
          Container(color: Colors.grey[200], height: 1),
        ],
      ),
    );
  }

  Widget _buildCaption() {
    return Text(
      post.caption,
    );
  }

  Widget _buildPostLike() {
    return Text(
      '${post.totalLike} likes}',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: AppTextStyles.textMedium,
    );
  }

  Widget _buildPostTitle() {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'BaoTrung ',
            style: AppTextStyles.textMedium,
          ),
          TextSpan(
            text: 'BaoTrung',
            style: AppTextStyles.textMediumLight,
          ),
        ],
      ),
    );
  }

  Widget _buildNumberOfComments(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('Tap to see comments');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CommentsScreen(),
          ),
        );
      },
      child: Text(
        'View all ${post.totalComment} comments',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTextStyles.textMediumLight.copyWith(color: Colors.grey),
      ),
    );
  }

  Widget _builldInteractive() {
    return Row(
      children: const [
        Icon(Icons.favorite_border, size: 30),
        SizedBox(width: 10),
        Icon(Icons.chat_bubble_outline, size: 30),
        SizedBox(width: 10),
        Icon(Icons.share, size: 30),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Image.network(
        post.image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          minRadius: 10,
          maxRadius: 15,
          backgroundImage: NetworkImage(post.avatar),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            post.username,
            style: AppTextStyles.textMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Icon(Icons.more_vert_outlined),
      ],
    );
  }
}
