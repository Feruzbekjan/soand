// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:soand/core/extension/extension.dart';
import 'package:soand/core/services/log.dart';
import 'package:soand/features/auth/data/model/register.dart';
import 'package:soand/features/auth/presentation/bloc/auth_bloc.dart';

class CreateUserName extends StatefulWidget {
  const CreateUserName({super.key});

  @override
  State<CreateUserName> createState() => _CreateUserNameState();
}

class _CreateUserNameState extends State<CreateUserName> {
  late TextEditingController userNameController;

  @override
  void initState() {
    userNameController = TextEditingController();
    super.initState();
  }

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
            mainAxisSize: MainAxisSize.max,
            children: [
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "@username",
                    style: context.style.fontSize32Weight800.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ).copyWith(bottom: 30),
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
                    const Gap(30),
                    TextField(
                      controller: userNameController,
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
        floatingActionButton: GestureDetector(
          onTap: () {
            context.read<AuthBloc>().add(
              CreateUserNameEvent(
                username: userNameController.text,
                onSuccess: () {
                  context.goNamed(context.route.home);
                },
                onFailure: (value) {
                  LogService.e(value);
                },
              ),
            );
          },
          child: Container(
            height: 80,
            width: 90,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90),
                topRight: Radius.circular(90),
                bottomRight: Radius.circular(90),
                bottomLeft: Radius.circular(5),
              ),
              color: Color(0xFF0076D8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SvgPicture.asset(context.icon.light),
            ),
          ),
        ),
      ),
    );
  }
}
