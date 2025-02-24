import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_mobile_field/mobile_number.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/input_validation/validation_input.dart';
import 'package:flymefy/features/auth/data/requests/request.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../../core/input_validation/input_validation.dart';
import '../../../../../../core/service/firebase.dart';
import '../../domain/entity/user.dart';

part 'login_persional_use_state.dart';

class LoginPersionUseCubit extends Cubit<LoginPersionalUseState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  LoginPersionUseCubit() : super(const LoginPersionalUseState());

}
