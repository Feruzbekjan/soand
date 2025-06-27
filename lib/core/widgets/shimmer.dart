import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHelper {
  Widget buildBasicShimmer(
      {double? height,
      double? width,
      double? radius,
      BoxShape? shape,
      double? topPadding,
      double? bottomPadding,
      double? leftPadding,
      Widget? child,
      double? rightPadding}) {
    height = height ?? 100;
    width = width ?? 375;
    radius = radius ?? 0;
    topPadding = topPadding ?? 0;
    bottomPadding = bottomPadding ?? 0;
    rightPadding = rightPadding ?? 0;

    leftPadding = leftPadding ?? 0;
    return Shimmer.fromColors(
      // baseColor: MyColors.shimmerBaseColor,
      // highlightColor: MyColors.shimmerHighlightColor,
      baseColor: const Color.fromRGBO(250, 247, 244, 1),
      highlightColor: const Color.fromRGBO(236, 236, 236, 1),
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(
          right: rightPadding,
          top: topPadding,
          left: leftPadding,
          bottom: bottomPadding,
        ),
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          borderRadius: shape == null ? BorderRadius.circular(radius) : null,
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
