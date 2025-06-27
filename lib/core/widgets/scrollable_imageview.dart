// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soand/core/widgets/image_preloader.dart';


import '../config/app_constants.dart';

class ScrollableImageview extends StatefulWidget {
  final List<String> imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Color borderColor;
  final double borderWidth;
  final bool? volumeOn;
  final Function()? onTap;
  final Clip? clipBehavior;
  final bool srolable;
  final bool bottomIndigator;

  const ScrollableImageview({
    super.key,
    this.imageUrl = const [],
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.volumeOn,
    this.onTap,
    this.clipBehavior,
    required this.srolable,
    this.bottomIndigator = false,
  });

  @override
  State<ScrollableImageview> createState() => _ScrollableImageviewState();
}

class _ScrollableImageviewState extends State<ScrollableImageview> {
  late PageController controller;
  bool isInitialized = false;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    List<String> ls = [];
    String url = '';
    for (var element in widget.imageUrl) {
      if (element.split(".").last == "mp4") {
        url = element;
      } else {
        ls.add(element);
      }
    }
    if (url.isNotEmpty) {
      ls.add(url);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              clipBehavior: widget.clipBehavior ?? Clip.hardEdge,
              height: MediaQuery.sizeOf(context).height * 0.41,
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                ),
                borderRadius:
                    widget.borderRadius ?? BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  PageView(
                    physics: !widget.srolable
                        ? const NeverScrollableScrollPhysics()
                        : null,
                    controller: controller,
                    children: [
                      ...List.generate(
                        ls.length,
                        (index) {
                          return Stack(
                            children: [
                              Align(
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius: widget.borderRadius ??
                                            BorderRadius.circular(16),
                                        clipBehavior: widget.clipBehavior ??
                                            Clip.hardEdge,
                                        child: ls[index].split(".").last ==
                                                "svg"
                                            ? SvgPicture.network(
                                                "${AppConstants.baseUrl}/${ls[index]}",
                                                placeholderBuilder: (context) =>
                                                    widget.placeholder ??
                                                    const ImagePreloadShimmer(),
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Center(
                                                  child: widget.errorWidget ??
                                                      const Icon(
                                                        Icons
                                                            .error_outline_rounded,
                                                      ),
                                                ),
                                              )
                                            : CachedNetworkImage(
                                                imageUrl:
                                                    "${AppConstants.baseUrl}/${ls[index]}",
                                                width: double.maxFinite,
                                                height: widget.height,
                                                color: widget.color,
                                                fit: widget.fit,
                                                placeholder: (context, url) =>
                                                    widget.placeholder ??
                                                    const ImagePreloadShimmer(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Center(
                                                  child: widget.errorWidget ??
                                                      const Icon(
                                                        Icons
                                                            .error_outline_rounded,
                                                      ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  if (widget.imageUrl.length > 1 &&
                      widget.srolable &&
                      widget.bottomIndigator == false)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: widget.imageUrl.length,
                          effect: const ExpandingDotsEffect(
                            // type: SwapType.yRotation,
                            activeDotColor: Colors.white,
                            dotHeight: 5,
                            dotWidth: 5,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (widget.imageUrl.length > 1 &&
            widget.srolable &&
            widget.bottomIndigator == true)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                controller: controller,
                count: widget.imageUrl.length,
                effect: const ExpandingDotsEffect(
                  // type: SwapType.yRotation,
                  activeDotColor: Colors.white,
                  dotHeight: 5,
                  dotWidth: 5,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
