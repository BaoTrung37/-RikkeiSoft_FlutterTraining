import 'package:app_chat/resources/app_images.dart';
import 'package:app_chat/provider/fireauth_provider.dart';
import 'package:app_chat/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../util/navigation_service.dart';
import '../../../widgets/text_form_base.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void _onSubmit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      String email = emailController.text;
      String password = passwordController.text;
      print(email);
      print(password);
      FireauthProvider()
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          if (value == true) {
            GetIt.I.get<NavigationSerivce>().to(
                  routeName: Routes.contactScreen,
                  isBack: false,
                );
                
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Wrong Pass'),
              ),
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              // top: 0,
              child: _buildBackgroundImage(context),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBody(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(60),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.76,
        color: AppColors.backgroundColor,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 55),
              _buildTitle(),
              const SizedBox(height: 69),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildEmailInput(),
                    const SizedBox(height: 24),
                    _buildPasswordInput(),
                    const SizedBox(height: 8),
                    _buildForgotPasswordText(),
                    const SizedBox(height: 80),
                    _buildSignInWithGoogle(),
                    const SizedBox(height: 24),
                    _buildSignIn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return TextFormBase(
      controller: passwordController,
      hintText: AppTexts.password,
      prefixIcon: const Icon(
        Icons.lock,
        color: AppColors.iconSecondary,
      ),
      isPassword: true,
    );
  }

  Widget _buildEmailInput() {
    return TextFormBase(
      controller: emailController,
      hintText: AppTexts.email,
      prefixIcon: const Icon(
        Icons.mail,
        color: AppColors.iconSecondary,
      ),
    );
  }

  Widget _buildSignInWithGoogle() {
    return GestureDetector(
      onTap: () async {
        print('hihi');
        // await FireauthProvider().signInWithGoogle();
        GetIt.I.get<NavigationSerivce>().to(routeName: Routes.chatRoomScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 49,
                top: 14,
                bottom: 14,
              ),
              child: AppImages.googleLogo,
            ),
            const SizedBox(width: 30),
            Text(
              AppTexts.signInWithGoogle,
              style: AppTextStyles.textLargeLight.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn() {
    return GestureDetector(
      onTap: _onSubmit,
      child: Container(
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            AppTexts.login,
            style: AppTextStyles.textLargeLight.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return Text(
      AppTexts.forgotPassword,
      style: AppTextStyles.textXSmallLight.copyWith(
        color: AppColors.textTertiary,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      AppTexts.loginTitle,
      style: AppTextStyles.labelLarge.copyWith(color: AppColors.labelPrimary),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: const Image(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
