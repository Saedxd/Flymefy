import 'package:flutter/material.dart';
import 'package:flymefy/core/extension/widget.dart';

class StatusWidget extends StatelessWidget {
  final String status;
  final String statusId;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;

  const StatusWidget({
    super.key,
    required this.status,
    required this.statusId,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.fontSize,
  });

  // Function to get container color based on statusId
  Color getContainerColor(String statusId) {
    switch (statusId) {
      case "5": // Normal pending
      case "3": // Pending Payment
        return const Color.fromARGB(255, 233, 86, 6); // Pending container color
      case "6": // Started
        return const Color(0xFFEFFBF2); // Started container color
      case "7": // Done
        return const Color(0xFFEFF8FF); // Done container color
      case "2": // Rejected by Rented (Cancelled)
        return const Color(0xFFFEF3F2); // Cancelled container color
      case "1": //Need Approval by Rented is StatusId 1
        return const Color(0xFFEFF8FF);
      default:
        return Colors.grey; // Default container color
    }
  }

  // Function to get text color based on statusId
  Color getTextColor(String statusId) {
    switch (statusId) {
      case "5": // Need Approval by Rented
      case "3": // Pending Payment
        return const Color.fromARGB(255, 249, 249, 249); // Pending text color
      case "6": // Started
        return const Color(0xFF18622D); // Started text color
      case "7": // Done
        return const Color(0xFF175CD3); // Done text color
      case "2": // Rejected by Rented (Cancelled)
        return const Color(0xFFB42318); // Cancelled text color
      case "1": //Need Approval by Rented is StatusId 1
        return const Color(0xFF175CD3);
      default:
        return Colors.black; // Default text color
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: getContainerColor(
              statusId), // Set container color based on statusId
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            status, // Display the status
            textAlign: TextAlign.center,
            style: TextStyle(
              color: getTextColor(statusId), // Set text color based on statusId
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ).paddingAll(2).paddingSymmetric(horizontal: 5),
        ),
      ),
    );
  }
}
