// ignore_for_file: must_be_immutable


import '../exports/app_exports.dart';


class CustomActionButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool isEnabled;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? buttonTextColor;
  final TextStyle? buttonTextStyle;
  final Color? borderColor;
  final EdgeInsets margin;

  const CustomActionButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width,
    this.height,
    this.isEnabled = true,
    this.isLoading = false,
    this.backgroundColor = kPrimaryColor,
    this.buttonTextColor,
    this.buttonTextStyle,
    this.borderColor,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled && !isLoading ? onTap : null,
      child: Container(
        height:height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color:
              isEnabled ? backgroundColor : backgroundColor!.withOpacity(0.5),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  buttonText,
                  textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: true,
                      applyHeightToLastDescent: false),
                  style: buttonTextStyle ??
                      AppStyles.w600f15josefin.copyWith(
                        color: buttonTextColor ?? kWhiteColor,
                      ),
                ),
        ),
      ),
    );
  }
}
