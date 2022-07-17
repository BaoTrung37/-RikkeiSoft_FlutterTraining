import 'package:app_chat/resources/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  AppImages._private();

  static final background = SvgPicture.asset(
    Assets.background,
    fit: BoxFit.cover,
  );

  static final googleLogo = SvgPicture.asset(
    Assets.googleLogo,
    fit: BoxFit.contain,
    height: 30,
    width: 30,
  );
}
