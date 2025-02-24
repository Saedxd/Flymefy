import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hyperpay_plugin/flutter_hyperpay.dart';
import 'package:hyperpay_plugin/model/ready_ui.dart';
import 'package:flymefy/core/resources_manager/color.dart';

class PayButtonTest extends StatefulWidget {
  const PayButtonTest({super.key});

  @override
  State<PayButtonTest> createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButtonTest> {
  late FlutterHyperPay flutterHyperPay;
  final String authorizationToken =
      "OGFjN2E0Yzg5MmI5MmUwZDAxOTJiOTlmNTk1ZTAxOTZ8dVlYaHdvNCNEVEQ9U295N29MRVE=";
  final String entityId = "8ac7a4c992bde0a90192bf25d1400331";

  @override
  void initState() {
    super.initState();
    flutterHyperPay = FlutterHyperPay(
      shopperResultUrl: InAppPaymentSetting.shopperResultUrlTest,
      paymentMode: PaymentMode.test,
      lang: InAppPaymentSetting.getLang(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final checkoutId = await _getCheckoutId();
        if (checkoutId != null) {
          log(checkoutId, name: "checkoutId");
          await _startPayment(checkoutId);
        } else {
          log("Checkout ID retrieval failed.");
        }
      },
      child: const Text('Pay Now'),
    );
  }

  Future<String?> _getCheckoutId() async {
    final url = Uri.parse('https://eu-test.oppwa.com/v1/checkouts');
    final headers = {
      'Authorization': 'Bearer $authorizationToken',
    };

    int m = math.Random().nextInt(200);
    var body = {
      'entityId': entityId,
      'amount': '200', // Example amount, update as needed
      'currency': 'SAR',
      'paymentType': 'DB',
      // 'testMode': 'EXTERNAL',
      'customParameters[3DS2_enrolled]': 'true',
      'merchantTransactionId': '${DateTime.now().microsecondsSinceEpoch}',
      'customer.email': 'customer$m@example.com',
      'billing.street1': 'Street Address$m',
      'billing.city': 'City$m',
      'billing.state': 'State$m',
      'billing.country': 'SA',
      'billing.postcode': '12345',
      'customer.givenName': 'First Name$m',
      'customer.surname': 'Last Name$m',
    };

    final response = await http.post(url, headers: headers, body: body);
    log(response.toString(), name: "response post");
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      log(responseData.toString(), name: "response post 200");
      return responseData['id'];
    } else {
      log('Error: ${response.body}', name: "response body Error");
      return null;
    }
  }

  Future<void> _startPayment(String checkoutId) async {
    final paymentResultData = await flutterHyperPay.readyUICards(
      readyUI: ReadyUI(
        brandsName: ["VISA", "MASTER", "MADA"],
        checkoutId: checkoutId,
        merchantIdApplePayIOS: InAppPaymentSetting.merchantId,
        countryCodeApplePayIOS: InAppPaymentSetting.countryCode,
        companyNameApplePayIOS: "Test Co",
        themColorHexIOS: "#000000",
        setStorePaymentDetailsMode: true,
      ),
    );

    log(paymentResultData.errorString.toString());
    log(paymentResultData.paymentResult.toString());

    if (paymentResultData.paymentResult == PaymentResult.success ||
        paymentResultData.paymentResult == PaymentResult.sync) {
      // Close the current screen if payment is successful
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Payment successful!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      // Show error message if payment fails
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Payment failed: ${paymentResultData.errorString ?? "Unknown error"}'),
            backgroundColor: ColorManager.redColor,
          ),
        );
      }
    }
  }
}

class InAppPaymentSetting {
  static const String shopperResultUrlTest = "com.testpayment.payment";
  static const String merchantId = "MerchantId";
  static const String countryCode = "SA";
  static String getLang() {
    return Platform.isIOS ? "en" : "en_US";
  }
}
