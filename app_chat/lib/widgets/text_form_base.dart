import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';

class TextFormBase extends StatefulWidget {
  final String? hintText;
  final String? intialValue;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final int maxLines;

  final bool isPassword;

  const TextFormBase({
    Key? key,
    this.hintText,
    this.intialValue,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.maxLines = 1,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<TextFormBase> createState() => _TextFormBaseState();
}

class _TextFormBaseState extends State<TextFormBase> {
  bool passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = widget.isPassword ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      controller: widget.controller,
      style: AppTextStyles.textSmallLight.copyWith(
        color: AppColors.textPrimary,
      ),
      initialValue: widget.intialValue,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      obscureText: passwordVisible,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        widget.controller?.text = value!;
      },
      // strutStyle: const StrutStyle(
      //   forceStrutHeight: true,
      //   fontSize: 18,
      //   height: 1.5,
      // ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        isDense: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.iconSecondary,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              )
            : null,
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.backgroundSecondaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.backgroundSecondaryColor,
          ),
        ),
      ),
    );
  }
}
