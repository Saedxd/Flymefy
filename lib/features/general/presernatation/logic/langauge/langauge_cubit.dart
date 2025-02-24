import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/general/domain/usecase/lang_usecase.dart';

import '../../../../../core/resources_manager/constant.dart';

part 'langauge_state.dart';

class LangaugeCubit extends Cubit<LangaugeState> {
  final GetLangUseCase _getLangUseCase;
  final CashLangUseCase _cashLangUseCase;

  LangaugeCubit(
      {required GetLangUseCase getLangUseCase,
      required CashLangUseCase cashLangUseCase})
      : _getLangUseCase = getLangUseCase,
        _cashLangUseCase = cashLangUseCase,
        super(const LangaugeState());

  void changeLang(String lang) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _cashLangUseCase(lang);
    result.fold(
      (failure) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      },
      (success) {
        emit(state.copyWith(
            flowStateApp: FlowStateApp.success, locale: lang.getLocale()));
      },
    );
  }

  void getLang() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _getLangUseCase(noParam);

    result.fold(
      (failure) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      },
      (lang) {
        emit(state.copyWith(
            flowStateApp: FlowStateApp.success, locale: lang.getLocale()));
      },
    );
  }
}
