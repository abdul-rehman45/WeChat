import 'package:chat/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SendMessageField extends StatelessWidget {
  const SendMessageField(
      {Key? key,
      this.sendTap,
      this.controller,
      this.onFileTap,
      this.onEmojiTap,
      this.keyPadTapped})
      : super(key: key);
  final VoidCallback? sendTap, onFileTap, onEmojiTap, keyPadTapped;
  // final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // height: 60,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            // AppColors.g6Color,
            AppColors.g5Color,
            // AppColors.g4Color,
            AppColors.g3Color,
            // AppColors.g2Color,
            // AppColors.lightGreen,
          ],
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onEmojiTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: const Icon(
                Icons.face,
                size: 22,
              ),
            ),
          ),
          InkWell(
            onTap: onFileTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: const Icon(Icons.file_copy, size: 22),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomTextField(
                controller: controller,
                hintText: 'Type a message...',
                keyPad: keyPadTapped,
                maxLines: 4,
                // onChanged: (text) {
                //   if (onChanged != null) onChanged!(text);
                // },
              ),
            ),
          ),
          InkWell(
            onTap: sendTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: const Icon(
                Icons.send,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.isPasswordField = false,
    this.isCheck = false,
    this.validator,
    this.suffixIcon,
    this.iconTap,
    this.keyboardType,
    this.onChanged,
    this.prefixIcon,
    this.maxLines = 1,
    this.keyPad,
  }) : super(key: key);
  final String hintText;
  final String? suffixIcon;
  final bool isPasswordField, isCheck;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? iconTap, keyPad;
  final Function(String)? onChanged;
  final String? prefixIcon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    // print("icon....$prefixIcon");
    return TextFormField(
      obscureText: isPasswordField,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      minLines: 1,
      maxLines: isPasswordField ? 1 : maxLines,
      onChanged: onChanged,
      onTap: keyPad,
      style: TextStyle(fontSize: 14, color: AppColors.textColor),
      decoration: InputDecoration(
        fillColor: AppColors.bgColor,
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon == null
            ? null
            : InkWell(
                onTap: iconTap,
                child: Image.asset(
                  prefixIcon!,
                  scale: 2.5,
                ),
              ),
        suffixIcon: suffixIcon == null
            ? null
            : InkWell(
                onTap: iconTap,
                child: Image.asset(
                  suffixIcon!,
                  scale: isCheck ? 5 : 2.5,
                ),
              ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        hintStyle: TextStyle(fontSize: 14, color: AppColors.textColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: AppColors.tfBorder),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: AppColors.tfBorder),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: AppColors.tfBorder),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: AppColors.tfBorder),
        ),
      ),
    );
  }

  static void unFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
