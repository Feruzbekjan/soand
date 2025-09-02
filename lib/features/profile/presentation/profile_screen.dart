import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:soand/core/config/icons.dart';
import 'package:soand/core/extension/extension.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: context.style.fontSize16Weight900.copyWith(
            color: context.colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.all(13),
                    width: double.maxFinite,
                    // height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // gradient: const LinearGradient(
                      //   colors: [Color.fromARGB(255, 65, 62, 62), Color(0xFF999999)],
                      // ),
                      color: const Color.fromARGB(255, 65, 62, 62),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF03B3EB),
                                        Color(0xFFFF8282),
                                        Color(0xFFF0941B),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ).createShader(bounds);
                                  },
                                  child: Text(
                                    "wendi",
                                    style: context.style.fontSize16Weight900
                                        .copyWith(color: context.colors.white),
                                  ),
                                ),
                                Text(
                                  "name",
                                  style: context.style.fontSize10Weight400
                                      .copyWith(
                                        color: context.colors.grey787878,
                                      ),
                                ),
                                Text(
                                  "@jonson_001",
                                  style: context.style.fontSize15Weight400
                                      .copyWith(color: context.colors.white),
                                ),
                                Text(
                                  "user",
                                  style: context.style.fontSize10Weight400
                                      .copyWith(
                                        color: context.colors.grey787878,
                                      ),
                                ),
                                Text(
                                  "bio:",
                                  style: context.style.fontSize15Weight400
                                      .copyWith(color: context.colors.white),
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: const EdgeInsets.only(left: 9),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF353535),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        context.icon.guest,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: const EdgeInsets.only(left: 9),

                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: context.colors.green1E353A,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        context.icon.contact,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      margin: const EdgeInsets.only(left: 9),
                                      width: 30,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFF353535,
                                          // ignore: deprecated_member_use
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        context.icon.guest,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      margin: const EdgeInsets.only(left: 9),
                                      width: 30,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF382020),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        context.icon.guest,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(14),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1D3726),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        context.icon.side,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      margin: const EdgeInsets.only(left: 9),
                                      width: 30,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF21343F),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        context.icon.edit,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      margin: const EdgeInsets.only(left: 9),
                                      width: 30,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF21343F),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(context.icon.eye),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width - 60,
                          child: Text(
                            "dcnskdjnclsdnclsdnclsdnclssdcsdcsdcnsdckjsndkcjnskdjnckjsndckjsdsdcsdcssdcsdcsdcsdcscdsdckjndkcjnskcjnskdcjnskdjncskjdncksdjncksjdncksjsdcsdccsdcsdcscsdkcjnsdkcjnskcnskdcnskdjcnskjdcnskdjcnksjndcksjndcksdjicsdcdcd",
                            style: context.style.fontSize10Weight400.copyWith(
                              color: context.colors.grey787878,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.only(left: 13),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              const Gap(8),
              ...List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                  ).copyWith(left: 9, right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: context.colors.black202020,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        padding: const EdgeInsets.all(6),
                        decoration:  BoxDecoration(
                          color: _getColor(index),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(_getIcon(index)),
                      ),
                      const Gap(15),
                      Text(
                        "theme colors",
                        style: context.style.fontSize16Weight900.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(context.icon.arrowRight),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  String _getIcon(index) {
    switch (index) {
      case 0:
        return AppIcons().theme;
      case 1:
        return AppIcons().language;
      case 2:
        return AppIcons().about;
      default:
        return AppIcons().backTheme;
    }
  }
   Color _getColor(index) {
    switch (index) {
      case 0:
        return const Color(0xFFF87B7B);
      case 1:
        return const Color(0xFF006EFF);
      case 2:
        return const Color(0xFF424242);
      default:
        return const Color(0xFFF27258);
    }
  }
}
