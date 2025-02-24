// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';

// import '../../../../../core/enum/enums.dart';
// import '../../../../../core/error/failure.dart';
// import '../../../../../core/input_validation/input_validation.dart';
// import '../../../data/request/request.dart';
// import '../../../domain/usecase/lang_usecase.dart';

// part 'help_center_state.dart';

// class HelpCenterCubit extends Cubit<HelpCenterState> {
//   final SendMessageToHelpCenterUseCase _sendMessageToHelpCenterUseCase;

//   HelpCenterCubit(
//       {required SendMessageToHelpCenterUseCase sendMessageToHelpCenterUseCase})
//       : _sendMessageToHelpCenterUseCase = sendMessageToHelpCenterUseCase,
//         super(const HelpCenterState());

//   void changeMessage(String value) {
//     emit(state.copyWith(
//         flowStateApp: FlowStateApp.normal,
//         formUpdate:
//             state.formUpdate.copyWith(message: StreetInput.dirty(value))));
//   }

//   void save() async {
//     emit(state.copyWith(flowStateApp: FlowStateApp.loading));

//     final result = await _sendMessageToHelpCenterUseCase(HelpCenterRequest(
//       message: state.formUpdate.message.value.trim(),
//     ));

//     result.fold(
//       (failure) {
//         emit(
//             state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
//       },
//       (success) {
//         emit(state.copyWith(
//             flowStateApp: FlowStateApp.success,
//             formUpdate: const FormUpdate()));
//       },
//     );
//   }
// }
