import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:soand/core/extension/extension.dart';
import 'package:soand/core/services/log.dart';
import 'package:soand/core/widgets/scrollable_imageview.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray600,
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 56),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top + 8,
            right: 16,
            left: 16,
          ),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "so&",
                    style: context.style.fontSize24Weight900.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                ],
              ),
              const Gap(16),

              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: context.colors.black202020,
                      filled: true,
                      hintText: "search",
                      hintStyle: context.style.fontSize12Weight300.copyWith(
                        color: context.colors.gray500,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: SvgPicture.asset(context.icon.search),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              GestureDetector( 
                onTap: () {
                  context.pushNamed(context.route.createChat);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.colors.black202020,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(context.icon.plus),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(top: 12),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: context.colors.black202020,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                        child: ScrollableImageview(srolable: false),
                      ),
                      const Gap(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF00C2FF),
                                      Color(0xFF0DD76C),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  "8",
                                  style: context.style.fontSize12Weight400
                                      .copyWith(color: context.colors.white),
                                ),
                              ),
                            ],
                          ),
                          const Gap(3),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width-32-16-80,
                                child: Text(
                                  "Artificial Intelligence and Automation",
                                  style: context.style.fontSize14Weight600
                                      .copyWith(color: context.colors.white),
                                ),
                              ),
                            ],
                          ),
                          const Gap(3),

                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF41F103),
                                          Color(0xFF19D8CB),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds);
                                    },
                                    child: Text(
                                      "12654",
                                      style: context.style.fontSize12Weight400
                                          .copyWith(
                                            color: context.colors.white,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    "online",
                                    style: TextStyle(
                                      fontSize: 5,
                                      fontWeight: FontWeight.w300,
                                      color: context.colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                height: 15,
                                width: 1,
                                color: context.colors.gray500,
                              ),
                              Column(
                                children: [
                                  ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF840E00),
                                          Color(0xFFC13929),
                                          Color(0xFFFFFF00),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds);
                                    },
                                    child: Text(
                                      "12",
                                      style: context.style.fontSize12Weight400
                                          .copyWith(
                                            color: context.colors.white,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    "will deleted",
                                    style: TextStyle(
                                      fontSize: 5,
                                      fontWeight: FontWeight.w300,
                                      color: context.colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  height: 3,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Color(0xFF7E7E7E),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
