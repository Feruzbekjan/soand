import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:soand/core/extension/extension.dart';
import 'package:soand/features/auth/data/model/register.dart';
import 'package:soand/features/auth/presentation/bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  bool isLoading = false;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign up",
                        style: context.style.fontSize32Weight800.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushReplacementNamed(context.route.login);
                        },
                        child: Container(
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
                            "Login",
                            style: context.style.fontSize20Weight800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
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
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Gap(4),
                          Text(
                            "Name",
                            style: context.style.fontSize15Weight400,
                          ),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              fillColor: context.colors.white,
                              filled: true,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.colors.white,
                                ),
                              ),
                            ),
                          ),
                          // const Spacer(),
                          Text(
                            "Password",
                            style: context.style.fontSize15Weight400,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: context.colors.white,

                              filled: true,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.colors.white,
                                ),
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
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              height: 120,
              padding: EdgeInsets.zero,
              color: context.colors.black,
              child: SizedBox(
                height: 104,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SlideAction(
                    height: 104,
                    reversed: false,

                    sliderRotate: false,
                    borderRadius: 60,

                    // sliderButtonIconPadding: 10,
                    outerColor: state.isLoading
                        ? Colors.transparent
                        : const Color(0xFFD9D9D9),
                    innerColor: Colors.transparent,
                    sliderButtonIconSize: 10,

                    // sliderButtonYOffset: 1,
                    sliderButtonIcon: Container(
                      // height: 80,
                      // width: 90,
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 25,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF04B6E9), Color(0xFF01F8BB)],
                        ),
                      ),
                      child: SvgPicture.asset(context.icon.iz),
                    ),
                    elevation: 0,

                    submittedIcon: Lottie.asset("assets/lotti/login.json"),

                    sliderButtonIconPadding: 0,

                    onSubmit: () async {
                      context.read<AuthBloc>().add(
                        IslocadingEvent(isLoading: true),
                      );
                      final completer = Completer<void>();
                      await Future.delayed(Duration(seconds: 2), () {
                        completer.complete();
                      });
                      await completer.future;
                      final completerr = Completer<void>();

                      context.read<AuthBloc>().add(
                        RegisterEvent(
                          model: RegisterModel(
                            fullName: nameController.text,
                            password: passwordController.text,
                          ),
                          onSuccess: () {
                            context.read<AuthBloc>().add(
                              IslocadingEvent(isLoading: false),
                            );
                            completerr.complete();
                            context.pushNamed(context.route.createUser);
                          },
                          onFailure: (value) {
                            context.read<AuthBloc>().add(
                              IslocadingEvent(isLoading: false),
                            );
                            completerr.complete();
                          },
                        ),
                      );
                      await completerr.future;

                      return;
                    },
                    child: Text(
                      "slide to start",
                      style: context.style.fontSize24Weight900.copyWith(
                        color: context.colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
