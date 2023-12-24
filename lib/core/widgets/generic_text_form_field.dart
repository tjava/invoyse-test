import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';
import 'package:invoyse_test/core/constants/string_constant.dart';
import 'package:invoyse_test/core/utils/email_validator.dart';
import 'package:invoyse_test/core/utils/text_field_validators.dart';
import 'package:invoyse_test/core/widgets/generic_text.dart';

class GenericTextFormField extends StatefulWidget {
  final TextEditingController editingController;
  final String label;
  final String? hint;
  final String? errorText;
  final IconData? icon;
  final TextInputType inputType;
  final int maxLine;
  final int? maxLen;
  final bool isRequired;
  final bool showErrorMsg;
  final bool obscureText;
  final bool isBusy;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Function()? onSuffixIconClick;
  final Icon? prefixIcon;
  final Function()? onPrefixIconClick;
  final Function(bool)? onFocusChange;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry contentPadding;
  final bool shouldEnableClearbutton;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final List<TextFieldValidatorEntity>? validators;
  final double labelSize;
  final bool hasSpaceBetween;
  final bool willShowDot;

  const GenericTextFormField(
      {required this.editingController,
      required this.label,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.maxLine = 1,
      this.maxLen,
      this.isRequired = false,
      this.showErrorMsg = true,
      this.icon,
      this.hint,
      this.isBusy = false,
      this.focusNode,
      this.inputFormatters,
      this.onEditingComplete,
      this.suffixIcon,
      this.onSuffixIconClick,
      this.prefixIcon,
      this.onPrefixIconClick,
      this.onFocusChange,
      this.onChanged,
      this.contentPadding = const EdgeInsets.all(8),
      this.shouldEnableClearbutton = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.validator,
      this.validators,
      this.errorText,
      this.labelSize = 16,
      this.hasSpaceBetween = false,
      this.willShowDot = false,
      Key? key})
      : super(key: key);

  @override
  State<GenericTextFormField> createState() => _GenericTextFormFieldState();
}

class _GenericTextFormFieldState extends State<GenericTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (bool isFocused) {},
      skipTraversal: true,
      child: Stack(
        children: <Widget>[
          TextFormField(
            onChanged: widget.onChanged,
            focusNode: widget.focusNode,
            keyboardType: widget.inputType,
            enabled: !widget.isBusy,
            maxLines: widget.maxLine,
            maxLength: widget.maxLen,
            cursorColor: black,
            onEditingComplete: widget.onEditingComplete,
            inputFormatters: widget.inputFormatters,
            textAlignVertical: TextAlignVertical.center,
            textCapitalization: widget.textCapitalization,
            // style: textTheme.bodyMedium,
            validator: widget.validator ??
                (String? value) {
                  if (widget.isRequired && value!.trim() == '') {
                    return widget.showErrorMsg ? errRequiredMsg : '??';
                  }
                  if (widget.inputType == TextInputType.emailAddress &&
                      !EmailValidator.validate(value)) {
                    if (value == '' && !widget.isRequired) {
                      return null;
                    } else {
                      return errInvalidEmail;
                    }
                  }
                  if (widget.validators != null && value != null && value.trim() != '') {
                    for (var validator in widget.validators!) {
                      if (!validator.isValid(value.trim())) {
                        return validator.message;
                      }
                    }
                  }
                  return null;
                },
            controller: widget.editingController,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: grey,
              label: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: GenericText(
                  text: widget.label,
                  color: lightGrey,
                  size: 16.sp,
                  weight: FontWeight.w400,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: grey,
                  width: 1.4.h,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: grey,
                  width: 1.4.h,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: grey,
                  width: 1.4.h,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: grey,
                  width: 1.4.h,
                ),
              ),
              contentPadding: widget.contentPadding,
              hintText: widget.hint,
              errorText: widget.errorText,
              suffixIcon: widget.suffixIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: GestureDetector(
                        child: widget.suffixIcon,
                        onTap: () => widget.onSuffixIconClick!(),
                      ),
                    )
                  : null,
              prefixIcon: widget.prefixIcon != null
                  ? GestureDetector(
                      child: widget.prefixIcon,
                      onTap: () => widget.onPrefixIconClick!(),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
