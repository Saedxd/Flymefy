import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flymefy/core/extension/widget.dart';

class PhotoViewScreen extends StatelessWidget {
  final String url;
  const PhotoViewScreen(
      {super.key = const Key('photo_view_screen'), required this.url});

  @override
  Widget build(BuildContext context) {
    //network image
    return ColoredBox(
        color: Colors.grey,
        child: PhotoView(
          imageProvider: NetworkImage(
            url.isEmpty ? 'https://via.placeholder.com/150' : url,
          ),
        )).toSizedBox(
      width: double.infinity,
      height: double.infinity,
    );
  }
}
