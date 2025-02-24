import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:flymefy/core/app_export.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final Function(bool) onLikeTapped;

  const FavoriteIcon(
      {super.key, required this.isFavorite, required this.onLikeTapped});
//todo : mohammed hesham comment -- pass color / withOpacity with details unit page
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33,
      height: 33,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(255, 255, 255, 0.79),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8.3,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LikeButton(
        padding: EdgeInsetsDirectional.only(
          start: 3,
          top: 3,
        ),
        isLiked: isFavorite,
        onTap: (bool isLiked) async {
          onLikeTapped(isLiked);
          return !isLiked;
        },
        circleColor: CircleColor(
          start: ColorManager.primaryColor,
          end: ColorManager.primaryColor,
        ),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: ColorManager.primaryColor,
          dotSecondaryColor: ColorManager.primaryColor,
        ),
        likeBuilder: (bool isLiked) {
          return SizedBox(
            width: 14,
            height: 14,
            child: Center(
              child: !isLiked
                  ? Assets.assetsImgLove.toSvgAssetImage(
                      width: 17,
                      height: 17,
                      color: ColorManager.primaryColor,
                      fit: BoxFit.contain)
                  : Assets.assetsImgLoveFilledSvg.toSvgAssetImage(
                      width: 17,
                      height: 17,
                      fit: BoxFit.contain,
                      color: ColorManager.primaryColor,
                    ),
            ),
          );
          // Icon(
          // Icons.favorite_border,
          //   color:
          //       isLiked ? ColorManager.primaryColor : ColorManager.primaryColor,
          //   size: 22,
          // );
        },
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        size: 22,
      ),
    );
  }
}
