
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_io/io.dart' show Platform; // You can also use context.isAndroid or context.isIOS if available


class PlatformSpecificRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const PlatformSpecificRefreshIndicator({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // Android-style RefreshIndicator
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: child,
      );
    } else {
      // iOS-style CupertinoSliverRefreshControl
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
          SliverToBoxAdapter(
            child: child,
          ),
        ],
      );
    }
  }
}