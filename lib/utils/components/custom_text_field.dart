import 'dart:developer';
import 'package:flutter/services.dart';
import '../exports/app_exports.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool? filled;
  final Color? fillColor;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? focusedBorderColor, bordercolor;
  final Color? prefixIconColor;
  final double? borderRadius;
  final double? textHorizontalPadding;
  final int? maxLines, maxLength;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? autoFocus, readOnly;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.filled,
      this.fillColor,
      this.enabled,
      this.focusedBorderColor,
      this.bordercolor,
      this.prefixIcon,
      this.prefixIconColor,
      this.suffixIcon,
      this.borderRadius,
      this.maxLines,
      this.keyboardType,
      this.validator,
      this.obscureText = false,
      this.autoFocus,
      this.readOnly,
      this.onChanged,
      this.onSubmitted,
      this.onTap,
      this.maxLength,
      this.inputFormatters,
      this.textHorizontalPadding = 18});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = true;

  get key => widget.key;

  get validator => widget.validator;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      key: key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC1C1C1).withValues(alpha: .2),
                    offset: const Offset(0, 1),
                    // Horizontal and vertical offset
                    blurRadius: 5,
                    // Blur radius
                    spreadRadius: 0, // Spread radius
                  ),
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextFormField(
                maxLength: widget.maxLength,
                onTap: widget.onTap,
                onChanged: (value) {
                  field.didChange(value);
                  widget.onChanged?.call(value);
                },
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onFieldSubmitted: widget.onSubmitted,
                inputFormatters: widget.inputFormatters,
                maxLines: widget.maxLines ?? 1,
                autofocus: widget.autoFocus ?? false,
                readOnly: widget.readOnly ?? false,
                obscureText: widget.obscureText && hidePassword,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                // style: AppStyles.w400f11josefin,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                cursorColor: kGrey400Color,
                cursorHeight: 14,
                scrollPadding: const EdgeInsets.all(0),
                decoration: InputDecoration(
                  counter: const SizedBox.shrink(),
                  border: InputBorder.none,
                  prefixIcon: widget.prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: widget.prefixIcon,
                        )
                      : null,
                  suffixIcon: widget.suffixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 29),
                          child: widget.suffixIcon,
                        )
                      : widget.obscureText
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                                log('Hide Password: ${hidePassword && widget.obscureText}');
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 29),
                                  child: hidePassword && widget.obscureText
                                      ? SvgPicture.asset(Assets.closedEyeIcon)
                                      : SvgPicture.asset(Assets.openEyeIcon)),
                            )
                          : null,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: widget.textHorizontalPadding!, vertical: 10),
                  prefixIconColor: widget.prefixIconColor,
                  errorStyle:
                      AppStyles.w300f11josefin.copyWith(color: kErrorColor),
                  hintText: widget.hintText,
                  hintStyle: AppStyles.w300f11josefin.copyWith(
                      fontWeight: FontWeight.w400, color: kGrey100Color),
                  filled: true,
                  fillColor: widget.fillColor ?? kWhiteColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: kOrangeColor)
                      // color: widget.focusedBorderColor ?? Colors.transparent),
                      ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 30),
                child: Text(
                  field.errorText!,
                  style: AppStyles.w300f11josefin.copyWith(color: kErrorColor),
                ),
              ),
          ],
        );
      },
    );
  }
}
