import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';

class NetWorkImageCashed extends StatelessWidget {
  final String url;
  final double size;
  final double height;
  final double width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BoxFit boxFit;
  final double? raduis;

  const NetWorkImageCashed(
      {super.key,
      required this.url,
      this.size = 24,
      this.height = 24,
      this.width = 24,
      this.raduis = 4,
      this.boxFit = BoxFit.cover,
      this.placeholder,
      this.errorWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: () {
      //   Navigator.of(context)
      //       .pushNamed(Routes.photoView, arguments: {'image': url});
      // },
      // onLongPress: () {
      //   Navigator.of(context)
      //       .pushNamed(Routes.photoView, arguments: {'image': url});
      // },
      child: CachedNetworkImage(
          fit: boxFit,
          imageUrl: url,
          cacheKey: url,
          fadeInDuration: const Duration(milliseconds: 100),
          fadeOutDuration: const Duration(milliseconds: 100),
          placeholderFadeInDuration: const Duration(milliseconds: 100),
          useOldImageOnUrlChange: false,
          alignment: Alignment.center,
          imageBuilder: (context, imageProvider) => Align(
                alignment: Alignment.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(raduis ?? 8),
                      topRight: Radius.circular(raduis ?? 8),
                      bottomLeft: Radius.circular(raduis ?? 8),
                      bottomRight: Radius.circular(raduis ?? 8),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SizedBox(
                    height: height,
                    width: width,
                  ),
                ),
              ),
          placeholder: (context, url) => Align(
                alignment: Alignment.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey[600],
                    ),

                    height: height,
                    width: width,
                    // child: Center(
                    //   child: placeholder ?? const DottedLoading(),
                    // ),
                  ),
                ),
              ),
          errorWidget: (context, url, error) {
            return SizedBox(
              height: height,
              width: width,
              child: errorWidget ??
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.assetsImgPlainLogoSvg,
                        height: 50,
                        width: 50,
                        color: ColorManager.primaryColor,
                      )
                    ],
                  ),
            );
          }),
    );
  }
}

class NetWorkImageCashedLogo extends StatelessWidget {
  final String url;
  final double size;
  final double height;
  final double width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BoxFit boxFit;

  const NetWorkImageCashedLogo(
      {super.key,
      required this.url,
      this.size = 24,
      this.height = 24,
      this.width = 24,
      this.boxFit = BoxFit.cover,
      this.placeholder,
      this.errorWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: () {
      //   Navigator.of(context)
      //       .pushNamed(Routes.photoView, arguments: {'image': url});
      // },
      // onLongPress: () {
      //   Navigator.of(context)
      //       .pushNamed(Routes.photoView, arguments: {'image': url});
      // },
      child: CachedNetworkImage(
          fit: boxFit,
          imageUrl: url,
          cacheKey: url,
          fadeInDuration: const Duration(milliseconds: 100),
          fadeOutDuration: const Duration(milliseconds: 100),
          placeholderFadeInDuration: const Duration(milliseconds: 100),
          useOldImageOnUrlChange: false,
          alignment: Alignment.center,
          imageBuilder: (context, imageProvider) => Align(
                alignment: Alignment.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: SizedBox(
                    height: height,
                    width: width,
                  ),
                ),
              ),
          placeholder: (context, url) => Align(
                alignment: Alignment.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: Center(
                      child: placeholder ?? const DottedLoading(),
                    ),
                  ),
                ),
              ),
          errorWidget: (context, url, error) {
            return Assets.assetsImgNoImage
                .toSvgAssetImage(
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                )
                .toSizedBox(height: height, width: width);
          }),
    );
  }
}
