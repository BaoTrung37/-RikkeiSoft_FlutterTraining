import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:app_chat/resources/app_colors.dart';
import 'package:app_chat/resources/assets.dart';

import '../../../../widgets/text_form_base.dart';

class FormSend extends StatefulWidget {
  const FormSend({
    Key? key,
    required this.onTap,
    required this.onChanged,
    this.controller,
  }) : super(key: key);

  final VoidCallback onTap;
  final ValueChanged<String?> onChanged;
  final TextEditingController? controller;
  @override
  State<FormSend> createState() => _FormSendState();
}

class _FormSendState extends State<FormSend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: AppColors.backgroundSecondaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          children: [
            _buildIconPlus(),
            const SizedBox(width: 21),
            _buildDividerVertical(),
            const SizedBox(width: 13),
            Expanded(
              child: TextFormBase(
                controller: widget.controller,
                hintText: 'Type a message',
                maxLines: 10,
                onChanged: widget.onChanged,
              ),
            ),
            const SizedBox(width: 13),
            _buildIconSend(),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerVertical() {
    return Container(
      width: 1,
      color: AppColors.colorGrey,
    );
  }

  Widget _buildIconPlus() {
    return Container(
      height: 38,
      width: 38,
      color: AppColors.itemColor,
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset(
        Assets.plus,
        color: AppColors.iconPrimary,
        width: 18,
        height: 18,
      ),
    );
  }

  Widget _buildIconSend() {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 38,
        width: 38,
        color: AppColors.itemColor,
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          Assets.arrowUp,
          color: AppColors.iconPrimary,
          width: 18,
          height: 18,
        ),
      ),
    );
  }
}
