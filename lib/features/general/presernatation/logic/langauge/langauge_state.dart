part of 'langauge_cubit.dart';

class LangaugeState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final Locale locale;

  const LangaugeState({
    this.locale = AppConstants.defaultLocal,
    this.flowStateApp = FlowStateApp.draft,
    this.failure = const Failure.empty(),
  });

  //copyWith is used to create a new instance of LangaugeState with the updated values
  LangaugeState copyWith({
    Locale? locale,
    FlowStateApp? flowStateApp,
    Failure? failure,
  }) {
    return LangaugeState(
      locale: locale ?? this.locale,
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [locale, flowStateApp, failure];
}
