// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:flymefy/core/di/locator.dart';
// import 'package:flymefy/core/enum/enums.dart';
// import 'package:flymefy/core/extension/context.dart';
// import 'package:flymefy/core/extension/data_type.dart';
// import 'package:flymefy/core/extension/widget.dart';
// import 'package:flymefy/core/helper/function.dart';
// import 'package:flymefy/core/resources_manager/color.dart';
// import 'package:flymefy/core/resources_manager/strings.dart';
// import 'package:flymefy/core/resources_manager/values.dart';
// import 'package:flymefy/core/widget/main_widget.dart';
// import 'package:flymefy/features/general/domain/entity/support_chat.dart';
// import 'package:flymefy/features/general/presernatation/logic/support_chat/chat_messages/support_chat_cubit.dart';
// import 'package:flymefy/features/general/presernatation/screen/Support_chat/chat_messages_listview.dart';
// import 'package:flymefy/features/general/presernatation/screen/help_center/help_center.dart';

// class ChatMessagesScreen extends StatelessWidget {
//   const ChatMessagesScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           instance<SupportChatCubit>()..getChatMessages(context),
//       child: const ContentView(),
//     );
//   }
// }

// class ContentView extends StatefulWidget {
//   const ContentView({
//     super.key,
//   });

//   @override
//   State<ContentView> createState() => _ContentViewState();
// }

// class _ContentViewState extends State<ContentView> {
//   @override
//   initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: const CustomAppBar(
//         title: AppStrings.supportTeam,
//       ),
//       body: MainHomeWidget(
//         child: Column(children: [
//           const Expanded(
//             child: ChatMesaagesListViewPaigation(),
//           ),
//           const inputTextForm(),
//         ]),
//       ),
//     );
//   }
// }

// class MessageItem extends StatelessWidget {
//   final Message data;
//   const MessageItem({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//           horizontal: AppSize.appSize16, vertical: AppSize.appSize8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           data.content.toText(context,
//               color: ColorManager.blackColor,
//               fontSize: 14,
//               lineHeight: 1.5,
//               fontWeight: FontWeight.w400,
//               overflow: TextOverflow.ellipsis),
//           (dateTime(data.sentAt, true)).toText(context,
//               color: ColorManager.blackColor.withOpacity(.45),
//               fontSize: 12,
//               lineHeight: 1.5,
//               fontWeight: FontWeight.w400,
//               overflow: TextOverflow.ellipsis),
//         ],
//       ),
//     );
//   }
// }

// String dateTime(String date, bool isArabic) {
//   return DateFormat.yMMMd(isArabic ? 'ar' : 'en')
//       .format(DateTime.tryParse(date) ?? DateTime.now());
// }

// DateTime dateTimeGroup(String date) {
//   final dateTime = DateTime.tryParse(date) ?? DateTime.now();
//   return DateTime(dateTime.year, dateTime.month, dateTime.day);
// }

// TimeOfDay timeOfDay(String date) {
//   final dateTime = (DateTime.tryParse(date) ?? DateTime.now());
//   return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
// }

// class SpecialChatBubbleOne extends CustomPainter {
//   final Color color;
//   final Alignment alignment;
//   final bool tail;
//   final bool addPadding;

//   SpecialChatBubbleOne({
//     required this.color,
//     required this.alignment,
//     required this.tail,
//     this.addPadding = true,
//   });

//   double _radius = 10.0;
//   double _x = 1.0;

//   @override
//   void paint(Canvas canvas, Size size) {
//     addPadding ? _x = 1.0 : _x = 0.0;
//     addPadding ? _radius = 10.0 : _radius = 0.0;

//     if (alignment == Alignment.topRight) {
//       if (tail) {
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               0,
//               0,
//               size.width - _x,
//               size.height,
//               bottomLeft: Radius.circular(_radius),
//               bottomRight: Radius.circular(_radius),
//               topLeft: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//         var path = Path();
//         path.moveTo(size.width - _x, 0);
//         path.lineTo(size.width - _x, 5);
//         path.lineTo(size.width, 0);
//         canvas.clipPath(path);
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               size.width - _x,
//               0.0,
//               size.width,
//               size.height,
//               topRight: const Radius.circular(3),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//       } else {
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               0,
//               0,
//               size.width - _x,
//               size.height,
//               bottomLeft: Radius.circular(_radius),
//               bottomRight: Radius.circular(_radius),
//               topLeft: Radius.circular(_radius),
//               topRight: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//       }
//     } else {
//       if (tail) {
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               _x,
//               0,
//               size.width,
//               size.height,
//               bottomRight: Radius.circular(_radius),
//               topRight: Radius.circular(_radius),
//               bottomLeft: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//         var path = Path();
//         path.moveTo(_x, 0);
//         path.lineTo(_x, 10);
//         path.lineTo(0, 0);
//         canvas.clipPath(path);
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               0,
//               0.0,
//               _x,
//               size.height,
//               topLeft: const Radius.circular(3),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//       } else {
//         canvas.drawRRect(
//             RRect.fromLTRBAndCorners(
//               _x,
//               0,
//               size.width,
//               size.height,
//               bottomRight: Radius.circular(_radius),
//               topRight: Radius.circular(_radius),
//               bottomLeft: Radius.circular(_radius),
//               topLeft: Radius.circular(_radius),
//             ),
//             Paint()
//               ..color = color
//               ..style = PaintingStyle.fill);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// class MessageFromReceiver extends StatelessWidget {
//   final SupportChatItem message;
//   const MessageFromReceiver({super.key, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppSize.appSize4.widthSizedBox,
//             CustomPaint(
//               painter: SpecialChatBubbleOne(
//                 color: const Color(0xFFE9E9E9),
//                 alignment:
//                     context.isArabic ? Alignment.topRight : Alignment.topLeft,
//                 tail: true,
//               ),
//               child: Container(
//                 constraints: BoxConstraints(
//                   maxWidth: MediaQuery.of(context).size.width * .60,
//                   minWidth: MediaQuery.of(context).size.width * .15,
//                   minHeight: 50,
//                 ),
//                 margin: const EdgeInsets.fromLTRB(7, 7, 7, 1),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 16.0),
//                             child: Text(
//                               message.message,
//                               style: TextStyle(
//                                 color: ColorManager.blackColor.withOpacity(.8),
//                                 fontSize: 13,
//                                 height: 1.5,
//                                 fontWeight: FontWeight.w600,
//                                 overflow: TextOverflow.visible,
//                               ),
//                               textAlign: context.isArabic
//                                   ? TextAlign.start
//                                   : TextAlign.end,
//                             ),
//                           ).paddingSymmetric(
//                               horizontal: message.message.isNotEmpty ? 4 : 0),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 2,
//                       right: 5,
//                       child: Text(
//                         timeOfDay(message.date).format(context),
//                         style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black54,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MessagesFromSender extends StatefulWidget {
//   final SupportChatItem message;
//   const MessagesFromSender({super.key, required this.message});

//   @override
//   State<MessagesFromSender> createState() => _MessagesFromSenderState();
// }

// class _MessagesFromSenderState extends State<MessagesFromSender> {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomPaint(
//               painter: SpecialChatBubbleOne(
//                 color: ColorManager.primaryColor,
//                 alignment:
//                     context.isArabic ? Alignment.topLeft : Alignment.topRight,
//                 tail: true,
//               ),
//               child: Container(
//                 constraints: BoxConstraints(
//                   maxWidth: MediaQuery.of(context).size.width * .55,
//                   minWidth: MediaQuery.of(context).size.width * .15,
//                   minHeight: 50,
//                 ),
//                 margin: const EdgeInsets.fromLTRB(7, 7, 7, 1),
//                 child: Stack(
//                   children: [
//                     Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 16.0),
//                           child: Text(
//                             widget.message.message,
//                             style: TextStyle(
//                               color: ColorManager.whiteColor.withOpacity(.8),
//                               fontSize: 13,
//                               height: 1.5,
//                               fontWeight: FontWeight.w600,
//                               overflow: TextOverflow.visible,
//                             ),
//                             textAlign: context.isArabic
//                                 ? TextAlign.start
//                                 : TextAlign.end,
//                           ),
//                         ).paddingSymmetric(horizontal: 0),
//                       ],
//                     ),
//                     Positioned(
//                       bottom: 2,
//                       left: 5,
//                       child: Text(
//                         timeOfDay(widget.message.date).format(context),
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           color: ColorManager.whiteColor.withOpacity(.8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             AppSize.appSize4.widthSizedBox,
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MessageImageTextClientProviderBuilder extends StatelessWidget {
//   final SupportChatItem message;

//   const MessageImageTextClientProviderBuilder({
//     super.key,
//     required this.message,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return !message.fromAdmin
//         ? MessagesFromSender(message: message)
//         : MessageFromReceiver(message: message);
//   }
// }

// class DateTimeMessages extends StatelessWidget {
//   final String date;
//   const DateTimeMessages({super.key, required this.date});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         DecoratedBox(
//             decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(4),
//                   topRight: Radius.circular(4),
//                   bottomRight: Radius.circular(4),
//                   bottomLeft: Radius.circular(4),
//                 ),
//                 color: ColorManager.primaryColor.withOpacity(.2),
//                 shape: BoxShape.rectangle),
//             child: getDateFormateMessage(date, context.isArabic ? 'ar' : "en")
//                 .toText(context,
//                     color: ColorManager.blackColor,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     overflow: TextOverflow.ellipsis)
//                 .paddingAll(8)),
//       ],
//     ).paddingSymmetric(vertical: 12);
//   }
// }

// class inputTextForm extends StatefulWidget {
//   const inputTextForm({
//     super.key,
//   });

//   @override
//   State<inputTextForm> createState() => _inputTextFormState();
// }

// class _inputTextFormState extends State<inputTextForm> {
//   late final TextEditingController controllerTextEdit;

//   @override
//   void initState() {
//     controllerTextEdit = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: ColorManager.whiteColor,
//       padding: const EdgeInsets.all(AppSize.appSize10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           AppSize.appSize4.widthSizedBox,
//           Expanded(
//             child: TextFormField(
//               minLines: 1,
//               maxLines: 4, // Allow a maximum of 4 lines
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               ),
//               keyboardType:
//                   TextInputType.multiline, // Change to multiline input
//               controller: controllerTextEdit,
//               onChanged: (value) {
//                 // Optional: Handle on change
//               },
//               decoration: InputDecoration(
//                 fillColor: const Color(0xFFF8F8F8),
//                 contentPadding: const EdgeInsets.all(8),
//                 filled: true,
//                 suffixIcon: BlocBuilder<SupportChatCubit, SupportChatState>(
//                   builder: (context, state) {
//                     return IconButton(
//                       iconSize: 30,
//                       enableFeedback: true,
//                       icon: const Icon(
//                         Icons.send_outlined,
//                         color: ColorManager.primaryColor,
//                       ),
//                       onPressed: state.flowStateApp == FlowStateApp.loading
//                           ? null
//                           : () {
//                               if (controllerTextEdit.text.isNotEmpty) {
//                                 context
//                                     .read<SupportChatCubit>()
//                                     .sendMessage(controllerTextEdit.text);
//                                 controllerTextEdit.clear();
//                               }
//                             },
//                     );
//                   },
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(
//                     color: Color(0xFFF2F2F2),
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(
//                     color: Color(0xFFF2F2F2),
//                   ),
//                 ),
//                 hintText: trans(context, AppStrings.writeAMessage),
//                 hintStyle: TextStyle(
//                   color: ColorManager.blackColor.withOpacity(.45),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
