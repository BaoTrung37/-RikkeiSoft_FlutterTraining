import 'package:app_chat/resources/app_colors.dart';
import 'package:app_chat/resources/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  AppIcons._private();

  static final mail = SvgPicture.asset(
    Assets.mail,
    color: AppColors.iconSecondary,
  );

  static final lock = SvgPicture.asset(
    Assets.lock,
    color: AppColors.iconSecondary,
  );
}
