import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:soand/core/extension/extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.black,
        appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width - 32 - 24) / 3,
                  child: Image.asset(context.image.s),
                ),
                const Gap(12),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width - 32 - 24) / 3,
                  child: Image.asset(context.image.o),
                ),
                const Gap(12),

                SizedBox(
                  width: (MediaQuery.sizeOf(context).width - 32 - 24) / 3,
                  child: Image.asset(context.image.a),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "login",
                    style: context.style.fontSize32Weight800.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.colors.blue,
                    ),
                    child: Text(
                      "Sign up",
                      style: context.style.fontSize20Weight800,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.sizeOf(context).height - 250,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFDADADA),
                  borderRadius: BorderRadius.circular(
                    60,
                  ).copyWith(topLeft: const Radius.circular(0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    const Gap(4),
                    Text(
                      "@user name",
                      style: context.style.fontSize15Weight400,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: context.colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.colors.white),
                        ),
                      ),
                    ),
                    // const Spacer(),
                    Text("Password", style: context.style.fontSize15Weight400),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: context.colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.colors.white),
                        ),
                      ),
                    ),
                    const Gap(13),
                    Text(
                      "Password must be at least 8 characters long",
                      style: context.style.fontSize12Weight600,
                    ),
                    Text(
                      "Password must contain at least one number",
                      style: context.style.fontSize12Weight600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: context.colors.black,
          child: SizedBox(
            height: 120,
            child: SlideAction(
              borderRadius: 60,
              // sliderButtonIconPadding: 10,
              outerColor: const Color(0xFFD9D9D9),
              innerColor: const Color(0xFFFE0764),
              sliderButtonIconSize: 10,
              sliderButtonIcon: SvgPicture.asset(context.icon.iz),
              submittedIcon: SvgPicture.asset(context.icon.iz),
              sliderButtonIconPadding: 8,
              onSubmit: () {
                context.goNamed(context.route.home);
                return;
              },
              child: Text(
                "slide to start",
                style: context.style.fontSize32Weight800.copyWith(
                  color: context.colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
