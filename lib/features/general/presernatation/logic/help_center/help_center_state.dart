// part of 'help_center_cubit.dart';

// class HelpCenterState extends Equatable {
//   final FlowStateApp flowStateApp;
//   final Failure failure;
//   final FormUpdate formUpdate;
//   const HelpCenterState({
//     this.flowStateApp = FlowStateApp.draft,
//     this.failure = const Failure.empty(),
//     this.formUpdate = const FormUpdate(),
//   });

//   HelpCenterState copyWith({
//     FlowStateApp? flowStateApp,
//     Failure? failure,
//     FormUpdate? formUpdate,
//   }) {
//     return HelpCenterState(
//       flowStateApp: flowStateApp ?? this.flowStateApp,
//       failure: failure ?? this.failure,
//       formUpdate: formUpdate ?? this.formUpdate,
//     );
//   }

//   @override
//   List<Object> get props => [
//         flowStateApp,
//         failure,
//         formUpdate,
//       ];
// }

// class FormUpdate extends Equatable with FormzMixin {
//   final StreetInput message;

//   const FormUpdate({
//     this.message = const StreetInput.pure(),
//   });

//   FormUpdate copyWith({
//     StreetInput? message,
//   }) {
//     return FormUpdate(
//       message: message ?? this.message,
//     );
//   }

//   @override
//   List<Object> get props => [
//         message,
//       ];

//   @override
//   List<FormzInput> get inputs => [
//         message,
//       ];
// }
