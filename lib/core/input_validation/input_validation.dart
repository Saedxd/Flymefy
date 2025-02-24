import 'dart:io';

import 'package:formz/formz.dart';
import 'package:flymefy/core/resources_manager/constant.dart';

import '../enum/enums.dart';
import 'validation_input.dart';

class PasswordInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const PasswordInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const PasswordInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validatePassword(value!);
  }
}

class LinkInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const LinkInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const LinkInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateLink(value!);
  }
}

class NameInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const NameInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const NameInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateName(value!);
  }
}

class StreetInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const StreetInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const StreetInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateStreet(value!);
  }
}

class YearInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const YearInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const YearInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateYear(value!);
  }
}

/////////////////////////////////////////////////

class CounterInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const CounterInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const CounterInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateCounter(value!);
  }
}

class PriceInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const PriceInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const PriceInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validatePrice(value!);
  }
}

class ConfirmPassword
    extends FormzInput<List<String>, DataSourceValidationInput>
    with ValidationImpl {
  const ConfirmPassword.pure()
      : super.pure(const [
          AppConstants.defaultEmptyString,
          AppConstants.defaultEmptyString
        ]);
  const ConfirmPassword.dirty(
      [super.value = const [
        AppConstants.defaultEmptyString,
        AppConstants.defaultEmptyString
      ]])
      : super.dirty();

  @override
  DataSourceValidationInput? validator(List<String>? value) {
    return validateConfirmPassword(value!);
  }
}

class PhoneInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const PhoneInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const PhoneInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validatePhone(value!);
  }
}

class ImageInput extends FormzInput<File?, DataSourceValidationInput>
    with ValidationImpl {
  const ImageInput.pure() : super.pure(null);
  const ImageInput.dirty([value]) : super.dirty(value);

  @override
  DataSourceValidationInput? validator(File? value) {
    return null;
  }
}

class ImagePathInput extends FormzInput<String?, DataSourceValidationInput>
    with ValidationImpl {
  const ImagePathInput.pure() : super.pure(null);
  const ImagePathInput.dirty([value]) : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return null;
  }
}

class EmailInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const EmailInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const EmailInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateEmail(value!);
  }
}

class DescriptionInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const DescriptionInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const DescriptionInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateDescription(value!);
  }
}

class ImageUpdateInput extends FormzInput<String?, DataSourceValidationInput> {
  final File? file; // For local images
  final String? url; // For network images
  final int? imageUrlId; // To store the ID of the image

  const ImageUpdateInput.pure()
      : file = null,
        url = null,
        imageUrlId = null,
        super.pure(null);

  ImageUpdateInput.local(File file)
      : file = file,
        url = null,
        imageUrlId = null,
        super.dirty(file.path); // Store file path as dirty value

  ImageUpdateInput.network(String url, int id)
      : file = null,
        url = url,
        imageUrlId = id, // Store ID for network images
        super.dirty(url);

  const ImageUpdateInput.dirty(String? value)
      : file = null,
        url = value,
        imageUrlId = null,
        super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return null; // Add validation logic if necessary
  }

  bool get isLocal =>
      file != null; // Helper method to check if it's a local image
}

class PromoCodeInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const PromoCodeInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const PromoCodeInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validatePromoCode(value!);
  }
}
