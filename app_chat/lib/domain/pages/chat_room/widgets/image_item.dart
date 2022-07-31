import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const ImageItem({
    Key? key,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (ctx, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (ctx, object, stackTrace) => errorContainer(ctx),
      ),
    );
  }

  Widget errorContainer(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'assets/images/img_not_available.jpeg',
      ),
    );
  }
}
