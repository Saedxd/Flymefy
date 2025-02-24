import 'package:flutter/material.dart';
import 'package:intl_mobile_field/countries.dart';
import 'package:intl_mobile_field/country_picker_dialog.dart';
import 'package:intl_mobile_field/intl_mobile_field.dart';
import 'package:intl_mobile_field/mobile_number.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/input_validation/input_border.dart';

class CustomIntlMobileField extends StatelessWidget {
  final Function(MobileNumber) onChanged;
  final Function(Country) onCountryChanged;
  final String initialCountryCode;
  final TextEditingController controller;
  final bool isReadOnly;
  final Color borderColor;
  Widget suffixIcon;

  CustomIntlMobileField({
    super.key,
    required this.onChanged,
    required this.onCountryChanged,
    this.initialCountryCode = 'SA',
    required this.controller,
    required this.borderColor,
    required this.suffixIcon,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntlMobileField(
      readOnly: isReadOnly,
      controller: controller,
      disableLengthCheck: true,
      autovalidateMode: AutovalidateMode.disabled,
      flagsButtonMargin: EdgeInsets.only(
          left: context.isArabic ? 0 : 15,
          right: context.isArabic ? 15 : 0,
          top: AppSize.appSize10,
          bottom: 10),
      dropdownIconPosition: IconPosition.trailing,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      pickerDialogStyle: PickerDialogStyle(
        searchFieldPadding: const EdgeInsets.symmetric(horizontal: 26),
        width: MediaQuery.of(context).size.width * .9,
        listTilePadding: const EdgeInsets.symmetric(horizontal: 27),
        listTileDivider: const Divider(
          thickness: 0.4,
          height: 0.4,
          color: Color(0xffE3E3E3),
        ),
        searchFieldInputDecoration: InputDecoration(
          hintTextDirection:
              context.isArabic ? TextDirection.rtl : TextDirection.ltr,
          fillColor: Colors.white,
          hintText: trans(context, AppStrings.search),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5C5C5C),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF2E2E2E),
            size: 26,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF242424), width: .5),
            borderRadius: BorderRadius.circular(50.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF242424), width: .5),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF242424), width: .5),
            borderRadius: BorderRadius.circular(50.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF242424), width: .5),
            borderRadius: BorderRadius.circular(50.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF242424), width: .5),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        countryCodeStyle: const TextStyle(
          color: Color(0xff2E2E2E),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        countryNameStyle: const TextStyle(
          color: Color(0xff2E2E2E),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        searchFieldTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.only(top: 27),
      ),
      onTapOutside: (event) => context.unFocusOnTapOutSite(event),
      fillColor: Colors.white,
      style: TextStyle(
        color: isReadOnly ? const Color(0xFFA8A4A7) : Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      textAlignVertical: TextAlignVertical.center,
      dropdownDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      dropdownTextStyle: const TextStyle(
        color: Colors.black,
        fontFamily: "AirbnbCereal",
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      countryCodePositionRight: true,
      cursorHeight: 20,
      textAlign: context.isArabic ? TextAlign.right : TextAlign.left,
      decoration: InputDecoration(
          suffixIcon: suffixIcon ?? SizedBox(),
          // floatingLabelAlignment: FloatingLabelAlignment.start,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.redColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          errorStyle: const TextStyle(color: ColorManager.redColor),
          contentPadding: const EdgeInsets.only(bottom: 30),
          hintText: "000-000-0000",
          alignLabelWithHint: true,
          hintStyle: getHintStyle()),
      dropdownIcon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Color(0xff1D1B20),
      ),
      initialCountryCode: initialCountryCode,
      disableLengthCounter: true,
      languageCode: "en",
      flagWidth: 25,
      // flagsButtonPadding: EdgeInsets.only(
      //     right: context.isArabic ? 15 : 0, left: context.isArabic ? 0 : 15),
      onChanged: (mobile) {
        onChanged(
          mobile,
        );
      },
      onCountryChanged: (country) {
        onCountryChanged(country);
      },
    );
  }
}
