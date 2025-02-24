// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:hyperpay_plugin/flutter_hyperpay.dart';
// import 'package:hyperpay_plugin/model/ready_ui.dart';
// import 'package:flymefy/core/app_export.dart';

// class PayButton extends StatefulWidget {
//   final String amount;
//   final bool isNewReservation;
//   final int reservationId;
//   final bool useApplePay;

//   const PayButton({
//     super.key,
//     required this.amount,
//     required this.isNewReservation,
//     required this.reservationId,
//     this.useApplePay = false,
//   });

//   @override
//   State<PayButton> createState() => _PayButtonState();
// }

// class _PayButtonState extends State<PayButton> {
//   late FlutterHyperPay flutterHyperPay;
//   final String authorizationToken =
//       "OGFjOWE0Y2E5NDQ0YjRlODAxOTQ0ZjUzZTI0ZjQ1NWN8P2VtVSs0QE5NbTZCUFhGam05cFA=";
//   String entityId = "";
//   List<String> brandsNameList = [];

//   @override
//   void initState() {
//     super.initState();
//     flutterHyperPay = FlutterHyperPay(
//       shopperResultUrl: InAppPaymentSetting.shopperResultUrl,
//       paymentMode: PaymentMode.live,
//       lang: InAppPaymentSetting.getLang(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<BookingRequestCubit, BookingRequestState>(
//       listener: (context, state) async {
//         if (state.flowStateApp == FlowStateApp.success) {
//           context.read<BookingRequestCubit>().changeStateTodraft();
//         }
//       },
//       builder: (context, state) {
//         print(state.bookingCheckOutData.reservationId.toIntValue());
//         return widget.useApplePay
//             ? PaymentOptionButton(
//                 title: AppStrings.applePay,
//                 assetWiget: [
//                   Assets.assetsImgApplePay.toSvgAssetImage(
//                       color: Colors.white,
//                       height: 27,
//                       width: 30,
//                       fromLogin: true),
//                 ].toRow(),
//                 onTap: () async {
//                   entityId = "8acda4c7948d2efa0194ad16af69762c";
//                   brandsNameList = ["APPLEPAY"];

//                   if (widget.isNewReservation) {
//                     await context
//                         .read<BookingRequestCubit>()
//                         .bookingRequestDone();
//                   } else {
//                     context.read<BookingRequestCubit>().changeStateToSuccess();
//                   }
//                   if (state.bookingCheckOutData.reservationId.toIntValue() !=
//                           0 ||
//                       !widget.isNewReservation) {
//                     final checkoutId = await _getCheckoutId();
//                     if (checkoutId != null) {
//                       log(checkoutId, name: checkoutId);
//                       int reservationId = widget.isNewReservation
//                           ? state.bookingCheckOutData.reservationId.toIntValue()
//                           : widget.reservationId;
//                       await _startPayment(checkoutId, reservationId.toString());
//                     } else {
//                       log("Checkout ID retrieval failed.");
//                     }
//                   }
//                 },
//               )
//             : PaymentOptionButton(
//                 title: AppStrings.visa_MasterCard,
//                 assetWiget: [
//                   SizedBox(
//                     width: 4,
//                   ),
//                   Assets.assetsImgVisa.toSvgAssetImageWithoutColor(
//                       height: 13, width: 30, fromLogin: true),
//                   SizedBox(
//                     width: 9,
//                   ),
//                   Assets.assetsImgMastercardLogoSvg.toSvgAssetImageWithoutColor(
//                       height: 20, width: 30, fromLogin: true),
//                 ].toRow(),
//                 onTap: () async {
//                   entityId = "8ac9a4ca9444b4e801944f5510de4565";
//                   brandsNameList = [
//                     "VISA",
//                     "MASTER",
//                     "MADA",
//                     // "STC_PAY",
//                   ];
//                   if (widget.isNewReservation) {
//                     await context
//                         .read<BookingRequestCubit>()
//                         .bookingRequestDone();
//                   } else {
//                     context.read<BookingRequestCubit>().changeStateToSuccess();
//                   }
//                   if (state.bookingCheckOutData.reservationId.toIntValue() !=
//                           0 ||
//                       !widget.isNewReservation) {
//                     final checkoutId = await _getCheckoutId();
//                     if (checkoutId != null) {
//                       log(checkoutId, name: checkoutId);
//                       int reservationId = widget.isNewReservation
//                           ? state.bookingCheckOutData.reservationId.toIntValue()
//                           : widget.reservationId;
//                       await _startPayment(checkoutId, reservationId.toString());
//                     } else {
//                       log("Checkout ID retrieval failed.");
//                     }
//                   }
//                 },
//               );
//       },
//     );
//   }

//   Future<String?> _getCheckoutId() async {
//     final url = Uri.parse('https://eu-prod.oppwa.com/v1/checkouts');
//     final headers = {
//       'Authorization': 'Bearer $authorizationToken',
//     };

//     int m = math.Random().nextInt(200);
//     double doubleValue = double.parse(widget.amount);
//     var body = {
//       'entityId': entityId,
//       'amount': doubleValue.toStringAsFixed(2),
//       // 'amount': widget.amount,
//       'currency': 'SAR',
//       'paymentType': 'DB',
//       'customParameters[3DS2_enrolled]': 'true',
//       'merchantTransactionId': '${DateTime.now().microsecondsSinceEpoch}',
//       'customer.email': 'customer$m@example.com',
//       'billing.street1': 'Street Address$m',
//       'billing.city': 'City$m',
//       'billing.state': 'State$m',
//       'billing.country': 'SA',
//       'billing.postcode': '12345',
//       'customer.givenName': 'First Name$m',
//       'customer.surname': 'Last Name$m',
//     };

//     final response = await http.post(url, headers: headers, body: body);
//     log(response.body.toString(), name: "response post");
//     log(response.toString(), name: "response post");
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       log(responseData.toString(), name: "response post 200");
//       return responseData['id'];
//     } else {
//       print("error found");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Payment failed: ${response.body.toString()}'),
//           backgroundColor: ColorManager.redColor,
//         ),
//       );
//       log('Error: ${response.body}', name: "response body Error");
//       return null;
//     }
//   }

//   Future<void> _startPayment(String checkoutId, String reservationId) async {
//     final paymentResultData = await flutterHyperPay.readyUICards(
//       readyUI: ReadyUI(
//         brandsName: brandsNameList,
//         // brandsName: ["VISA", "MASTER", "MADA", "STC_PAY", "APPLEPAY"],
//         checkoutId: checkoutId,
//         merchantIdApplePayIOS: InAppPaymentSetting.merchantId,
//         countryCodeApplePayIOS: InAppPaymentSetting.countryCode,
//         companyNameApplePayIOS: "Rest Fort",
//         themColorHexIOS: "#000000",
//         setStorePaymentDetailsMode: true,
//       ),
//     );

//     log(paymentResultData.errorString.toString());
//     log(paymentResultData.paymentResult.toString());

//     if (paymentResultData.paymentResult == PaymentResult.success ||
//         paymentResultData.paymentResult == PaymentResult.sync) {
//       // Close the current screen if payment is successful
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Payment successful!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//         Navigator.pushNamed(context, Routes.successBooking,
//             arguments: {'id': reservationId.toIntValue()});
//       }
//     } else {
//       // Show error message if payment fails
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//                 'Payment failed: ${paymentResultData.errorString ?? "Unknown error"}'),
//             backgroundColor: ColorManager.redColor,
//           ),
//         );
//       }
//     }
//     context.read<BookingRequestCubit>().checkOutBookingFinish(
//         reservationId: reservationId,
//         transactionId: checkoutId,
//         transactionStatus: paymentResultData.paymentResult.name,
//         transactionStatusDescription: paymentResultData.errorString);
//   }
// }

// class InAppPaymentSetting {
//   static const String shopperResultUrl = "com.testpayment.payment";
//   static const String merchantId = "MerchantId";
//   static const String countryCode = "SA";
//   static String getLang() {
//     return Platform.isIOS ? "en" : "en_US";
//   }
// }
