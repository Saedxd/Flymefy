import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_mobile_field/mobile_number.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/input_validation/input_validation.dart';
import 'package:flymefy/core/service/countery_ext.dart';
import 'package:flymefy/features/auth/data/requests/request.dart';
import 'package:flymefy/features/auth/domain/entity/register.dart';
import 'package:flymefy/features/auth/domain/usecase/register_use_case.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../core/helper/function.dart';
import '../../../../../core/logger/logger.dart';
import '../../../../../core/resources_manager/strings.dart';
import '../../../../../core/service/firebase.dart';
import '../../../../../core/service/picker_photos.dart';

part 'regiter_persional_use_state.dart';

class RegiterPersionalUseCubit extends Cubit<RegiterPersionalUseState> {
  final RegiterUseCase _regiterPersionalUseCase;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ImagePickering _imagePicker;

  RegiterPersionalUseCubit(
      {required RegiterUseCase regiterPersionalUseCase,
      required ImagePickering imagePicker})
      : _regiterPersionalUseCase = regiterPersionalUseCase,
        _imagePicker = imagePicker,
        super(const RegiterPersionalUseState());

}
