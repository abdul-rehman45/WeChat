import 'package:chat/constants/app_colors.dart';
import 'package:chat/helper/helper.dart';
import 'package:chat/helper/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.hint,
    required this.textEditingController,
    this.onChange,
    this.suffixIconPath,
    this.onSuffixTap,
    this.inputType = TextInputType.text,
    required this.title,
    this.fillColor,
    this.borderColor,
    this.isPassword = false,
    this.validate,
    this.isclear = false,
    this.obscureText = false,
    this.validationLenght,
    this.validationRegax,
    this.isPhoneNumber = false,
    this.isonchange = true,
    this.errorBorderColor,
    this.underLineField = false,
    this.successBorderColor = Colors.green,
    this.failureBorderColor = AppColors.theme,
  }) : super(key: key);
  final String hint, title;
  final RegExp? validationRegax;
  final int? validationLenght;
  String? suffixIconPath;
  final TextEditingController textEditingController;
  final void Function(String)? onChange;
  final String? Function(String?)? validate;
  final VoidCallback? onSuffixTap;
  final TextInputType inputType;
  final Color? fillColor;
  Color? borderColor, errorBorderColor, successBorderColor, failureBorderColor;
  final bool? isPassword, isPhoneNumber, isonchange;
  bool? isclear, underLineField;

  bool obscureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Helper.setTextStyle(
            10.sp,
            FontWeight.w400,
          ),
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: widget.textEditingController,
          onChanged: widget.onChange,
          //?? ontextChange,
          keyboardType: widget.inputType,
          cursorColor: AppColors.theme,
          style: Helper.setTextStyle(12.sp, FontWeight.w500),
          obscureText: widget.obscureText,
          validator: widget.validate,
          decoration: InputDecoration(
            enabled: true,
            filled: true,

            fillColor: widget.fillColor ?? Colors.white, // AppColors.lightGrey,
            hintText: widget.hint,
            hintStyle: Helper.setTextStyle(12.sp, FontWeight.w400,
                color: AppColors.text.withOpacity(0.7)),
            errorStyle: Helper.setTextStyle(12.sp, FontWeight.w300,
                color: AppColors.red),
            errorBorder: widget.underLineField == true
                ? _setUnderLineBorder()
                : _setBorder(widget.errorBorderColor ?? Colors.transparent),
            focusedErrorBorder: widget.underLineField == true
                ? _setUnderLineBorder()
                : _setBorder(widget.errorBorderColor ?? Colors.transparent),
            border: widget.underLineField == true
                ? _setUnderLineBorder()
                : _setBorder(widget.borderColor ?? Colors.transparent),
            enabledBorder: widget.underLineField == true
                ? _setUnderLineBorder()
                : _setBorder(widget.borderColor ?? Colors.transparent),
            focusedBorder: widget.underLineField == true
                ? _setUnderLineBorder()
                : _setBorder(widget.borderColor ?? Colors.transparent),

            suffix: _suffixIcon(),
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }

  void ontextChange(value) {
    if (widget.validationRegax != null) {
      bool? isValidate = Validators.onTextChange(
          value: value.toString(), validationRegax: widget.validationRegax);
      if (isValidate == true) {
        setState(() {
          widget.borderColor = widget.successBorderColor;
        });
      } else {
        setState(() {
          widget.borderColor = widget.failureBorderColor;
        });
      }
    }
  }

  Widget? _suffixIcon() {
    return widget.suffixIconPath != null
        ? InkWell(
            onTap: () {
              if (widget.isPassword != true) {
                if (widget.isclear == true) {
                  setState(() {
                    widget.suffixIconPath = null;
                  });
                  widget.textEditingController.text = "";
                }
              } else {
                // if (widget.suffixIconPath == AppIcons.passwordhide) {
                //   setState(() {
                //     widget.suffixIconPath = AppIcons.passwordunhide;
                //     widget.obscureText = false;
                //   });
                // } else {
                //   setState(() {
                //     widget.suffixIconPath = AppIcons.passwordhide;
                //     widget.obscureText = true;
                //   });
                // }
              }
            },
            child: Image.asset(
              widget.suffixIconPath!,
              // width: 10.sp,
              scale: 4.0,
              //color: AppColors.theme,
            ),
          )
        : null;
  }

  _setBorder(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 2));
  _setUnderLineBorder() => UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.transparent, width: 2));
}
