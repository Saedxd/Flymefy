import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';

import '../../input_validation/input_border.dart';
import '../../resources_manager/font.dart';
import '../../service/countery_ext.dart';

class LabelText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final double? width;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final TextBaseline? textBaseline;
  const LabelText({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.padding,
    this.margin,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.height,
    this.width,
    this.letterSpacing,
    this.fontStyle,
    this.textBaseline,
  });
  @override
  Widget build(BuildContext context) {
    return text.toText(
      context,
      textAlign: textAlign ?? TextAlign.start,
      color: color ?? ColorManager.lableInputColor,
      fontSize: fontSize ?? FontManager.fontSize14,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: fontFamily,
      softWrap: softWrap,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}

class LabelTextRequired extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final double? width;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final TextBaseline? textBaseline;
  const LabelTextRequired({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.padding,
    this.margin,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.height,
    this.width,
    this.letterSpacing,
    this.fontStyle,
    this.textBaseline,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: trans(context, text),
        style: TextStyle(
          color: color ?? ColorManager.lableInputColor,
          fontSize: fontSize ?? FontManager.fontSize18,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: fontFamily,
          overflow: overflow ?? TextOverflow.ellipsis,
        ),
        children: [
          TextSpan(
            text: ' *', // Asterisk
            style: TextStyle(
              color: Colors.red, // Asterisk color
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    // [
    //   text.toText(
    //     context,
    //     textAlign: textAlign ?? TextAlign.start,
    //     color: color ?? ColorManager.lableInputColor,
    //     fontSize: fontSize ?? FontManager.fontSize14,
    //     fontWeight: fontWeight ?? FontWeight.w500,
    //     fontFamily: fontFamily,
    //     softWrap: softWrap,
    //     overflow: overflow ?? TextOverflow.ellipsis,
    //     maxLines: maxLines,
    //   ),
    //   Icon(Icons.star, color: ColorManager.redColor, size: 15),
    // ].toRow(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    // );
  }
}

class LabelTextWithOptional extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final double? width;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final TextBaseline? textBaseline;
  const LabelTextWithOptional({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.padding,
    this.margin,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.height,
    this.width,
    this.letterSpacing,
    this.fontStyle,
    this.textBaseline,
  });
  @override
  Widget build(BuildContext context) {
    return [
      trans(context, text).toText(
        context,
        textAlign: textAlign ?? TextAlign.start,
        color: color ?? ColorManager.blackColor,
        fontSize: fontSize ?? FontManager.fontSize14,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily,
        softWrap: softWrap,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines,
      ),
      trans(context, AppStrings.optional).toText(
        context,
        textAlign: textAlign ?? TextAlign.start,
        color: color ?? ColorManager.blackColor,
        fontSize: fontSize ?? FontManager.fontSize14,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily,
        softWrap: softWrap,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines,
      )
    ].toRow();
  }
}

class EmailInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;

  final ValueChanged<String> onChanged;
  final Color? fillColor;
  final bool? readOnly;
  final String? initialValue;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  //border

  //optional
  const EmailInputView({
    super.key,
    this.fillColor,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.readOnly,
    this.initialValue,
    this.suffixIcon,
    this.controller,
    required this.onChanged,
    this.textInputAction,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize65,
      child: TextFormField(
        textInputAction: textInputAction ?? TextInputAction.next,
        onChanged: onChanged,
        controller: controller,
        initialValue: initialValue,
        textAlign: textAlign ?? TextAlign.start,
        readOnly: readOnly ?? false,
        keyboardType: TextInputType.emailAddress,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        style: textStyle ??
            TextStyle(
                fontFamily: "AirbnbCereal",
                fontSize: AppSize.appSize16,
                color: readOnly == null
                    ? ColorManager.blackColor
                    : readOnly == true
                        ? const Color(0xFFA8A4A7)
                        : ColorManager.blackColor,
                fontWeight: FontWeight.w500),
        textDirection: textDirection ??
            (context.isArabic ? TextDirection.ltr : TextDirection.ltr),
        decoration: InputDecoration(
          fillColor: fillColor ?? ColorManager.whiteColor,
          errorMaxLines: 1,
          border: getInputBorder(),
          suffixIcon: suffixIcon,
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                  vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
          // isDense: true,
          prefixIcon: preffuixIcon,
          hintText: trans(context, hintText ?? AppStrings.email),
          hintStyle: hintStyle ?? getHintStyle(isEnglish: true),
          errorText: error != null ? trans(context, error!) : null,
        ),
      ),
    );
  }
}

class GenericInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final bool? isReadOnly;
  final bool? isEnabled;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final String? initialValue;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;
  final Widget? suffixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final Color? fillColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;

  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  //border

  //optional
  const GenericInputView({
    super.key,
    this.padding,
    this.isEnabled,
    this.contentPadding,
    this.margin,
    this.controller,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.suffixIcon,
    this.errorStyle,
    this.error,
    this.fillColor,
    this.inputFormatters,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.onTap,
    this.isReadOnly,
    this.initialValue,
    required this.onChanged,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final isEnglish = controller != null
        ? RegExp(r'^[\x00-\x7F]+$').hasMatch(controller!.text)
        : false;

    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: height ?? (error != null ? AppSize.appSize80 : AppSize.appSize65),
      child: TextFormField(
        enabled: isEnabled ?? true,
        initialValue: initialValue,
        textInputAction: textInputAction ?? TextInputAction.done,
        controller: controller,
        onTap: onTap,
        maxLength: length ?? 1000,
        inputFormatters: inputFormatters,
        readOnly: isReadOnly ?? false,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        style: textStyle ??
            getTextStyle(
                isEnglish: isEnglish,
                colorText: isReadOnly == null
                    ? ColorManager.blackColor
                    : isReadOnly == true
                        ? const Color(0xFFA8A4A7)
                        : ColorManager.blackColor),
        minLines: minLines,
        maxLines: maxLines,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        decoration: InputDecoration(
          border: getInputBorder(),

          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ??
              getErrorStyle(
                  isEnglish: isEnglish,
                  overflow: TextOverflow.visible,
                  fontWeightError: FontWeight.w300,
                  fontSizeError: FontManager.fontSize10),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                  vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
          // isDense: true,
          prefixIcon: preffuixIcon,

          suffixIcon: suffixIcon,

          fillColor: fillColor ?? ColorManager.whiteColor,
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),

          errorText: error != null ? trans(context, error!) : null,
        ),
      ),
    );
  }
}

class GenericInputViewVersionTextArea extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final bool? isReadOnly;
  final bool? isEnabled;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final String? initialValue;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;
  final Widget? suffixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final Color? fillColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;

  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  //border

  //optional
  const GenericInputViewVersionTextArea({
    super.key,
    this.padding,
    this.isEnabled,
    this.contentPadding,
    this.margin,
    this.controller,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.suffixIcon,
    this.errorStyle,
    this.error,
    this.fillColor,
    this.inputFormatters,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.onTap,
    this.isReadOnly,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: height ?? AppSize.appSize200,
      child: TextFormField(
        enabled: isEnabled ?? true,
        initialValue: initialValue,
        controller: controller,
        onTap: onTap,
        maxLength: length ?? 100,
        inputFormatters: inputFormatters,
        readOnly: isReadOnly ?? false,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        style: textStyle ??
            getTextStyle(
                colorText: isReadOnly == null
                    ? ColorManager.blackColor
                    : isReadOnly == true
                        ? const Color(0xFFA8A4A7)
                        : ColorManager.blackColor),
        minLines: minLines,
        maxLines: maxLines,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        decoration: InputDecoration(
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ??
              getErrorStyle(
                  overflow: TextOverflow.visible,
                  fontWeightError: FontWeight.w300,
                  fontSizeError: FontManager.fontSize10),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                  vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
          // isDense: true,
          prefixIcon: preffuixIcon,
          suffixIcon: suffixIcon,

          fillColor: fillColor ?? ColorManager.whiteColor,
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null ? trans(context, error!) : null,
        ),
      ),
    );
  }
}

class PasswordInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;

  final ValueChanged<String> onChanged;
  final Function()? hidePassword;
  final bool? visiable;
  final Widget? suffixIcon;
  final String? initialValue;
  final bool? isReadOnly;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  //border

  //optional
  const PasswordInputView({
    super.key,
    this.padding,
    this.fillColor,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.visiable,
    this.hidePassword,
    this.suffixIcon,
    this.initialValue,
    this.isReadOnly,
    required this.onChanged,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize65,
      child: TextFormField(
        textInputAction: textInputAction ?? TextInputAction.next,
        readOnly: isReadOnly ?? false,
        initialValue: initialValue,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: TextInputType.text,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        obscureText: visiable ?? false,
        maxLength: length ?? 60,
        style: textStyle ??
            getTextStyle(
                colorText: isReadOnly == null
                    ? ColorManager.blackColor
                    : isReadOnly == true
                        ? const Color(0xFFA8A4A7)
                        : ColorManager.blackColor),
        decoration: InputDecoration(
          fillColor: fillColor ?? ColorManager.whiteColor,
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                  vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
          //isDense: true,
          prefixIcon: preffuixIcon,
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              visiable ?? true ? Icons.visibility_off : Icons.visibility,
              color: ColorManager.primaryColor,
            ),
            onPressed: hidePassword,
          ),
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null
              ? trans(context, error ?? AppStrings.validInput)
              : null,
        ),
      ),
    );
  }
}

class CurrencyInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final bool? isReadOnly;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final Widget? suffixIcon;
  final Color? fillColor;
  final ValueChanged<String> onChanged;
  final String? initialValue;

  //border

  //optional
  const CurrencyInputView({
    super.key,
    this.padding,
    this.fillColor,
    this.isReadOnly,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.suffixIcon,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize65,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        maxLength: length ?? 10,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
          // english
        ],
        readOnly: isReadOnly ?? false,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        style: textStyle ??
            getTextStyle(
                colorText: isReadOnly == null
                    ? ColorManager.blackColor
                    : isReadOnly == true
                        ? const Color(0xFFA8A4A7)
                        : ColorManager.blackColor),
        decoration: InputDecoration(
          fillColor: fillColor ?? ColorManager.whiteColor,
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                  vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
          // isDense: true,
          prefixIcon: preffuixIcon,

          suffixIcon: suffixIcon,
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null
              ? trans(context, error ?? AppStrings.validInput)
              : null,
        ),
      ),
    );
  }
}

class PhoneInputView extends StatefulWidget {
  final bool? isReadOnly;
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Widget? preffuixIcon;
  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final Widget? suffixIcon;
  final String? initialValue;
  Country defaultCountry; // New field for default country
  final ValueChanged<List<String>> onChanged;
  final Color? fillColor;

  PhoneInputView({
    super.key,
    this.fillColor,
    this.isReadOnly,
    this.controller,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.suffixIcon,
    this.initialValue,
    required this.onChanged,
    required this.defaultCountry, // New parameter for default country
  });

  @override
  State<PhoneInputView> createState() => _PhoneInputViewState();
}

class _PhoneInputViewState extends State<PhoneInputView> {
  @override
  void dispose() {
    super.dispose();
  }

  // Default country set to Saudi Arabia

  int get getLength {
    return widget.defaultCountry.maxLength;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8),
      width: widget.width ?? double.infinity,
      height: widget.error != null ? null : 65,
      child: TextFormField(
        controller: widget.controller ?? TextEditingController(),
        //  initialValue: widget.initialValue ?? "",

        onChanged: (value) {
          String error = "";
          if (value.length < widget.defaultCountry.minLength + 1 &&
              value.isNotEmpty) {
            error = "Invalid phone number"; // Customize this error message
          }
          widget.onChanged([
            value,
            widget.defaultCountry.dialCode,
            error,
            widget.defaultCountry.code
          ]);
        },
        textAlign: widget.textAlign ?? TextAlign.start,
        keyboardType: TextInputType.phone,
        cursorColor: widget.cursorColor ?? Colors.blue,
        cursorHeight: widget.cursorHeight ?? 20,
        cursorWidth: widget.cursorWidth ?? 2,
        style: widget.textStyle ??
            TextStyle(
                fontFamily: "AirbnbCereal",
                color: widget.isReadOnly ?? true
                    ? const Color(0xFFA8A4A7)
                    : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15),
        decoration: InputDecoration(
          fillColor: widget.fillColor ?? Colors.white,
          focusedBorder: widget.focusedBorder ?? getInputBorder(),
          enabledBorder: widget.enabledBorder ?? getInputBorder(),
          errorBorder: widget.erorrBorder ?? getInputBorderError(),
          disabledBorder: widget.disabledBorder ?? getInputBorderError(),
          errorStyle: widget.errorStyle ??
              const TextStyle(color: ColorManager.redColor),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          prefixIcon: prefixIconsCode(),
          suffixIcon: widget.suffixIcon,
          prefixIconConstraints: const BoxConstraints(minWidth: 70),
          hintText: getHintString(widget.defaultCountry.maxLength),
          hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey),
          errorText: widget.error,
        ),
      ),
    );
  }

  Widget prefixIconsCode() {
    return GestureDetector(
      onTap: () async {
        await showCustomModalBottomSheet(
          context: context,
          builder: (_) {
            return SearhCountry(
              onChanged: (value) {
                widget.controller!.clear();
                setState(() {
                  widget.defaultCountry = value;
                });
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
              "${widget.defaultCountry.flag} +${widget.defaultCountry.dialCode}",
              style: const TextStyle(color: Colors.black)),
          const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey),
        ],
      ),
    );
  }

  String getHintString(int len) {
    switch (len) {
      case 9:
        return " 000-000-000";
      case 10:
        return " 000-000-0000";
      default:
        return "000-000-0000";
    }
  }
}

class SearhCountry extends StatefulWidget {
  final Function(Country) onChanged;
  const SearhCountry({super.key, required this.onChanged});

  @override
  State<SearhCountry> createState() => _SearhCountryState();
}

class _SearhCountryState extends State<SearhCountry> {
  List<Country> activeCountries = countries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height - 100,
      width: context.width,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: context.width,
            child: TextFormField(
              onTapOutside: (event) => context.unFocusOnTapOutSite(event),
              onChanged: (query) {
                setState(() {
                  activeCountries = countries
                      .where((element) => element.name
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: trans(context, AppStrings.search),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5C5C5C)),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF2E2E2E),
                  size: 26,
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF242424), width: .5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF242424), width: .5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF242424), width: .5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF242424), width: .5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF242424), width: .5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ).paddingSymmetric(horizontal: 16, vertical: 16),
          // SearchInputView(
          //   height: 50,
          //   preffuixIcon:
          //       const Icon(Icons.search, color: Colors.grey, size: 24),
          //   hintText: trans(context, AppStrings.search),
          //   onChanged: (value) {
          //     setState(() {
          //       activeCountries = countries
          //           .where((element) => element.name
          //               .toLowerCase()
          //               .contains(value.toLowerCase()))
          //           .toList();
          //     });
          //   },
          // ).paddingSymmetric(horizontal: 16, vertical: 16),
          Expanded(
            child: ListView.builder(
              itemCount: activeCountries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipOval(
                    child: Image.asset(
                      'assets/flags/${activeCountries[index].code.toLowerCase()}.png',
                      height: 32,
                      width: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(activeCountries[index].name,
                      style: const TextStyle(fontSize: 16)),
                  trailing: Text("+${activeCountries[index].dialCode}",
                      style: const TextStyle(fontSize: 16)),
                  onTap: () {
                    widget.onChanged(activeCountries[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownInputStringsView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final Widget? suffixIcon;
  final ValueChanged<String?> onChanged;
  final String? value;
  final List<String> items;
  final Color? fillColor;
  final Function()? onTap;
  final bool isHafe;

  //border

  //optional
  const DropDownInputStringsView({
    super.key,
    this.padding,
    this.fillColor,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.suffixIcon,
    this.value,
    required this.items,
    required this.onChanged,
    required this.isHafe,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
        width: width ?? double.infinity,
        height: error != null ? null : AppSize.appSize65,
        child: InputDecorator(
          decoration: InputDecoration(
            fillColor: fillColor ?? ColorManager.whiteColor,
            errorText: error,
            filled: true,
            border: border ?? getInputBorder(),
            enabledBorder: enabledBorder ?? getInputBorder(),
            focusedBorder: focusedBorder ?? getInputBorder(),
            errorBorder: erorrBorder ?? getInputBorderError(),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                    vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
            //  isDense: true,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.appSize0,
              ),
              icon: suffixIcon ??
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManager.blackColor,
                    size: AppSize.appSize24,
                  ),
              iconSize: AppSize.appSize24,
              elevation: 16,
              value: value,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: FontManager.fontSize14,
                  color: ColorManager.blackColor,
                  overflow: TextOverflow.ellipsis),
              onChanged: onChanged,
              hint: Text(
                trans(context, hintText ?? AppStrings.geranlHintText),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFA8A4A7),
                ),
              ),
              alignment: AlignmentDirectional.centerStart,
              onTap: onTap,
              isExpanded: false,
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((String item) {
                  return value
                      .toText(
                        context,
                        color: ColorManager.blackColor,
                        fontSize: FontManager.fontSize14,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                      )
                      .toCenter();
                }).toList();
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    alignment: AlignmentDirectional.centerStart,
                    child: value.toText(
                      context,
                      color: ColorManager.blackColor,
                      fontSize: FontManager.fontSize14,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ));
              }).toList(),
            ),
          ),
        ));
  }
}

class GenericReadOnlyInputView extends StatefulWidget {
  final String value;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  //fillColor
  final Color? fillColor;
  //border

  const GenericReadOnlyInputView({
    super.key,
    required this.value,
    this.fillColor,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
  });

  @override
  State<GenericReadOnlyInputView> createState() =>
      _GenericReadOnlyInputViewState();
}

class _GenericReadOnlyInputViewState extends State<GenericReadOnlyInputView> {
  bool isCoppied = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: widget.width ?? double.infinity,
      height: widget.height ?? AppSize.appSize65,
      child: TextFormField(
        readOnly: true,
        initialValue: widget.value.isEmpty ? null : widget.value,
        textAlign: widget.textAlign ?? TextAlign.start,
        keyboardType: TextInputType.text,
        cursorColor: widget.cursorColor ?? ColorManager.primaryColor,
        cursorHeight: widget.cursorHeight ?? AppSize.appSize20,
        cursorWidth: widget.cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        decoration: InputDecoration(
          fillColor: widget.fillColor ?? ColorManager.whiteColor,
          border: getInputBorder(),
          focusedBorder: widget.focusedBorder ?? getInputBorder(),
          enabledBorder: widget.enabledBorder ?? getInputBorder(),
          errorBorder: widget.erorrBorder ?? getInputBorderError(),
          disabledBorder: widget.disabledBorder ?? getInputBorderError(),
          errorStyle: widget.errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(
                  vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
          //  isDense: true,
          prefixIcon: widget.preffuixIcon,
          suffixIcon: IconButton(
            icon: Icon(
              isCoppied ? Icons.check : Icons.copy,
              color: isCoppied
                  ? ColorManager.primaryColor
                  : ColorManager.greyColor.withOpacity(0.70),
            ),
            onPressed: () async {
              if (widget.value.isEmpty) return;
              await Clipboard.setData(ClipboardData(text: widget.value))
                  .then((_) {
                setState(() {
                  isCoppied = true;
                });
                instance<IShowAlertMessage>().showSnakeBarSuccess(
                  context,
                  AppStrings.successCopy,
                );

                delayForCreateNewStatus(second: 3).then((_) {
                  setState(() {
                    isCoppied = false;
                  });
                });
              });
            },
          ),
          hintText:
              trans(context, widget.hintText ?? AppStrings.geranlHintText),
          hintStyle: widget.hintStyle ?? getHintStyle(),
        ),
      ),
    );
  }
}

class SearchInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final bool? isReadOnly;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final String? initialValue;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;
  final Widget? suffixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final Color? fillColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  //border

  //optional
  const SearchInputView({
    super.key,
    this.padding,
    this.contentPadding,
    this.margin,
    this.controller,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.suffixIcon,
    this.errorStyle,
    this.error,
    this.fillColor,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.onTap,
    this.isReadOnly,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: isReadOnly ?? false,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: cursorColor ?? ColorManager.primaryColor,
      cursorHeight: cursorHeight ?? AppSize.appSize20,
      cursorWidth: cursorWidth ?? AppSize.appSize2,
      style: textStyle ??
          getTextStyle(
              colorText: isReadOnly == null
                  ? ColorManager.blackColor
                  : isReadOnly == true
                      ? const Color(0xFFA8A4A7)
                      : ColorManager.blackColor),
      minLines: minLines,
      maxLines: maxLines,
      onTapOutside: (event) => context.unFocusOnTapOutSite(event),
      decoration: InputDecoration(
        border: getInputBorder(),

        enabledBorder: enabledBorder ?? getInputBorder(),
        focusedBorder: focusedBorder ?? getInputBorder(),
        errorBorder: erorrBorder ?? getInputBorderError(),
        disabledBorder: disabledBorder ?? getInputBorderError(),
        errorStyle: errorStyle ?? getErrorStyle(),
        counterText: AppConstants.defaultEmptyString,

        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
                vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
        //  isDense: true,
        prefixIcon: preffuixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? ColorManager.whiteColor,
        hintText: trans(context, hintText ?? AppStrings.geranlHintText),
        hintStyle: hintStyle ?? getHintStyle(),
      ),
    );
  }
}

class Lable extends StatelessWidget {
  final String lable;
  const Lable({super.key, required this.lable});

  @override
  Widget build(BuildContext context) {
    return lable.toText(
      context,
      color: ColorManager.blackColor,
      fontWeight: FontWeight.w700,
      fontSize: FontManager.fontSize24,
    );
  }
}

class LableToNavaigateAntherPage extends StatelessWidget {
  final String title;
  final String value;
  final Function() onPressed;
  final MainAxisAlignment mainAxisAlignment;

  const LableToNavaigateAntherPage(
      {super.key,
      required this.mainAxisAlignment,
      required this.title,
      required this.value,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        maxLines: 2,
        TextSpan(children: [
          TextSpan(
            text: "${trans(context, title)} ",
            style: TextStyle(
              fontSize: FontManager.fontSize14,
              fontWeight: FontWeight.w400,
              color: ColorManager.blackColor.withOpacity(0.45),
            ),
          ),
          TextSpan(
            text: "${trans(context, value)}.",
            style: const TextStyle(
              fontSize: FontManager.fontSize14,
              fontWeight: FontWeight.w400,
              color: ColorManager.primaryColor,
            ),
          ),
        ]));
  }
}

class SearchCounterGenericInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final bool? isReadOnly;
  final bool? isEnabled;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final String? initialValue;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;
  final Widget? suffixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final Color? fillColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  //border

  //optional
  const SearchCounterGenericInputView({
    super.key,
    this.padding,
    this.isEnabled,
    this.contentPadding,
    this.margin,
    this.controller,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.suffixIcon,
    this.errorStyle,
    this.error,
    this.fillColor,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.onTap,
    this.isReadOnly,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize65,
      child: TextFormField(
        enabled: isEnabled ?? true,
        initialValue: initialValue,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: length ?? 8,
        controller: controller,
        onTap: onTap,
        readOnly: isReadOnly ?? false,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: keyboardType ??
            const TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        style: textStyle ?? getTextStyle(),
        minLines: minLines,
        maxLines: maxLines,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        decoration: InputDecoration(
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                  vertical: AppSize.appSize8, horizontal: AppSize.appSize16),
          // isDense: true,
          prefixIcon: preffuixIcon,
          suffixIcon: suffixIcon,
          fillColor: fillColor ?? ColorManager.whiteColor,
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null ? trans(context, error!) : null,
        ),
      ),
    );
  }
}
