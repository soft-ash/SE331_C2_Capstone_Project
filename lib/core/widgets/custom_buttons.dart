import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../constants/colors.dart';
import '../font/font.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
    this.height = 52,
    this.radius = 12,
    this.padding,
    this.color,
    this.border,
    this.textColor = Colors.white,
    this.prefixIcon,
    this.suffixIcon,
    this.elevation = 0,
    this.textStyle,
  });

  final String text;
  final VoidCallback? onPressed;

  final double width;
  final double height;
  final double radius;
  final double elevation;

  final EdgeInsetsGeometry? padding;

  final Color? color;
  final Border? border;
  final Color textColor;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextStyle? textStyle;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius.r);

    return SizedBox(
      width: width == double.infinity ? double.infinity : width.w,
      height: height.h,
      child: Material(
        color: Colors.transparent,
        elevation: elevation,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: _isDisabled
                ? AppColor.gray300
                : (color ?? AppColor.primary500),
            borderRadius: borderRadius,
            border: border,
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: borderRadius,
            child: Padding(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefixIcon != null) ...[
                    IconTheme(
                      data: IconThemeData(
                        color: _isDisabled ? AppColor.gray500 : textColor,
                        size: 20.sp,
                      ),
                      child: prefixIcon!,
                    ),
                    SizedBox(width: 8.w),
                  ],
                  Flexible(
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style:
                          (textStyle ??
                                  AppFont.style(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ))
                              .copyWith(
                                color: _isDisabled
                                    ? AppColor.gray500
                                    : textColor,
                              ),
                    ),
                  ),
                  if (suffixIcon != null) ...[
                    SizedBox(width: 8.w),
                    IconTheme(
                      data: IconThemeData(
                        color: _isDisabled ? AppColor.gray500 : textColor,
                        size: 20.sp,
                      ),
                      child: suffixIcon!,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
