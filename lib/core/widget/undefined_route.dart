import 'package:flutter/material.dart';
import 'package:flymefy/core/helper/function.dart';
import 'package:flymefy/core/resources_manager/strings.dart';

class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          trans(context, AppStrings.undefinedRoute),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
