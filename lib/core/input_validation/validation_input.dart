import 'dart:io';

import 'package:flymefy/core/enum/enums.dart';

mixin ValidationImpl {
  DataSourceValidationInput? validatePhone(String? phone) {
    // pattern for phone number in morocco
    //   RegExp regExp = RegExp(r'^\+212[5-9]\d{8}$');
    //   if (phone == null || phone.isEmpty) {
    //     return DataSourceValidationInput.empty;
    //   } else if (!regExp.hasMatch(phone)) {
    //     return DataSourceValidationInput.usernameStyle;
    //   }
    //   return null;
    // }
    if (phone != null) {
      if (phone.length > 15 || phone.length < 10) {
        return DataSourceValidationInput.usernameStyle;
      }
    }
    return null;
  }
}

DataSourceValidationInput? validateImage(File? imagePath) {
  if (imagePath == null) {
    return DataSourceValidationInput.inValidImg;
  } else if (imagePath.path.isEmpty) {
    return DataSourceValidationInput.inValidImg;
  }
  //end with image ext ios ext img

  else if (!imagePath.path.endsWith('.jpg') &&
      !imagePath.path.endsWith('.png') &&
      !imagePath.path.endsWith('.jpeg') &&
      !imagePath.path.endsWith('.gif') &&
      !imagePath.path.endsWith('.bmp')) {
    return DataSourceValidationInput.inValidImg;
  }

  return null;
}

DataSourceValidationInput? validateName(String? name) {
  if (name == null) {
    return DataSourceValidationInput.empty;
  } else if (name.length < 3) {
    return DataSourceValidationInput.length;
  } else if (name.length > 120) {
    return DataSourceValidationInput.nameistoolong;
    //RegExp(r'^[a-zA-Z\u0600-\u06FF]+$') accept space between words
  } else if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(name)) {
    return DataSourceValidationInput.inValidFormat;
  }
  return null;
}

//validate year
DataSourceValidationInput? validateYear(String? year) {
  if (year == null || year.isEmpty) {
    return DataSourceValidationInput.empty;
  } else if (year.length != 4) {
    return DataSourceValidationInput.inValidFormat;
  } else if (int.tryParse(year) != null) {
    if (int.parse(year) > 1970 && int.parse(year) <= DateTime.now().year) {
      return null;
    } else {
      return DataSourceValidationInput.inValidFormat;
    }
  }
  return DataSourceValidationInput.inValidFormat;
}

DataSourceValidationInput? validateLink(String? value) {
  var urlPattern =
      r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?';
  var match = RegExp(urlPattern, caseSensitive: false);
  if (value == null) {
    return DataSourceValidationInput.inValidFormat;
  } else if (!match.hasMatch(value)) {
    return DataSourceValidationInput.inValidFormat;
  }
  return null;
}

DataSourceValidationInput? validateCounter(String? counter) {
  if (counter == null || counter.isEmpty) {
    return DataSourceValidationInput.empty;
  } else if (int.tryParse(counter) == null) {
    return DataSourceValidationInput.inValidFormat;
  }

  return null;
}

DataSourceValidationInput? validatePrice(String? counter) {
  if (counter == null || counter.isEmpty) {
    return DataSourceValidationInput.empty;
  } else if (double.tryParse(counter) == null) {
    return DataSourceValidationInput.inValidFormat;
  } else if (double.parse(counter) < 0) {
    return DataSourceValidationInput.inValidFormat;
  } else if (double.parse(counter) > 10000000000000) {
    return DataSourceValidationInput.inValidFormat;
  }

  return null;
}

DataSourceValidationInput? validateConfirmPassword(List<String>? list) {
  if (list == null || list.isEmpty) {
    return DataSourceValidationInput.notIdenticalPassword;
  }
  if (list.length == 2) {
    if (list[0] != list[1]) {
      return DataSourceValidationInput.notIdenticalPassword;
    }
  }

  return null;
}

DataSourceValidationInput? validateEmail(String? email) {
  final exp = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (email == null || email.isEmpty) {
    return DataSourceValidationInput.empty;
  }
  if (!exp.hasMatch(email)) {
    return DataSourceValidationInput.notEmail;
  }
  return null;
}

DataSourceValidationInput? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return DataSourceValidationInput.empty;
  }
  final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
  if (!regex.hasMatch(password)) {
    return DataSourceValidationInput.weakPassword;
  }
  if (password.length > 25) {
    return DataSourceValidationInput.veryLong;
  }
  return null;
}

DataSourceValidationInput? validateDescription(String? description) {
  if (description == null || description.isEmpty) {
    return DataSourceValidationInput.empty;
  }
  if (description.length < 8) {
    return DataSourceValidationInput.descriptionVeryShort;
  }
  if (description.length > 400) {
    return DataSourceValidationInput.descriptionVeryLong;
  }
  return null;
}

DataSourceValidationInput? validatePromoCode(String? title) {
  if (title == null || title.isEmpty) {
    return DataSourceValidationInput.empty;
  }
  if (title.length < 3) {
    return DataSourceValidationInput.promoCodeVeryShort;
  }
  if (title.length > 20) {
    return DataSourceValidationInput.promoCodeVeryLong;
  }
  return null;
}

// stree 120
DataSourceValidationInput? validateStreet(String? title) {
  if (title == null || title.isEmpty) {
    return DataSourceValidationInput.empty;
  }
  if (title.length < 3) {
    return DataSourceValidationInput.lengthStreet;
  }
  if (title.length > 120) {
    return DataSourceValidationInput.lengthStreetVeryLong;
  }
  return null;
}
