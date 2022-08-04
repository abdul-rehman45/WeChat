class Validators {
  static String? validatePassword(value) => value!.isEmpty
      ? "Password can not be empty"
      : value.length < 8
          ? "Password should be at least 8 digits long"
          : !(RegExp(r'^(?=.*\d)').hasMatch(value))
              ? "Password must conatain at least 1 digit"
              : null;

  static String? validatePhoneNumber(value) => value!.isEmpty
      ? "Phone number can not be empty"
      : value.length != 11 || !RegExp(r'(^03[0-9]{9}$)').hasMatch(value)
          ? "Invalid Phone number"
          : null;

  static onTextChange({
    required String value,
    int? validationLenght,
    RegExp? validationRegax,
  }) {
    if (value.isNotEmpty) {
      // if (isPassword == true && isConfirmPassword == false) {
      //   setState(() {
      //     AppStrings.passwordText = "";
      //     AppStrings.passwordText = value;
      //   });
      // }

      if (validationLenght != null) {
        if (value.length == validationLenght) {
          if (validationRegax != null) {
            if (!validationRegax.hasMatch(value)) {
              return true;
            } else {
              return false;
            }
          }
        }
        // else {
        //   if (validationRegax != null) {
        //     if (value.length == validationLenght ||
        //         value.length > validationLenght!) {
        //       if (!widget.validationRegax!.hasMatch(value)) {
        //         setState(() {
        //           if (widget.isPassword != true) {
        //             widget.suffixIconPath = AppIcons.sufixinfo;
        //           }

        //           widget.borderColor = AppColors.yellow;
        //         });
        //       } else {
        //         setState(() {
        //           if (widget.isPassword != true) {
        //             widget.suffixIconPath = AppIcons.sufixtick;
        //           }
        //           widget.borderColor = AppColors.g3green;
        //         });
        //       }
        //     }
        //   }
        // else {
        //   if (value.length == widget.validationLenght ||
        //       value.length > widget.validationLenght!) {
        //     setState(() {
        //       widget.suffixIconPath = AppIcons.sufixtick;
        //       widget.borderColor = AppColors.g3green;
        //     });
        //   }
        // }
      } else if (validationLenght == null) {
        if (!validationRegax!.hasMatch(value)) {
          return true;
          // if (widget.isPassword != true) {
          //   widget.suffixIconPath = AppIcons.sufixinfo;
          // }

        } else {
          return false;
          // if (widget.isPassword != true) {
          //   widget.suffixIconPath = AppIcons.sufixtick;
          // }

        }
      }
    }
  }
}
