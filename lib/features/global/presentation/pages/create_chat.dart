import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soand/core/extension/extension.dart';
import 'package:soand/core/services/service_locator.dart';

class CreateChatPage extends StatefulWidget {
  const CreateChatPage({super.key});

  @override
  State<CreateChatPage> createState() => _CreateChatPageState();
}

class _CreateChatPageState extends State<CreateChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      appBar: AppBar(
        title: Text("create room", style: context.style.fontSize16Weight900),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(26),
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(35),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFC846), Color(0xFF03B3EB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(context.icon.photo),
              ),
              const Gap(33),
              Text(
                "soand rooms text ",
                style: context.style.fontSize15Weight400.copyWith(
                  color: context.colors.white,
                ),
              ),
              const Gap(7),
              TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  fillColor: context.colors.white,
                  filled: true,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.colors.white),

                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ).copyWith(topLeft: const Radius.circular(0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.colors.white),

                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ).copyWith(topLeft: const Radius.circular(0)),
                  ),
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ...List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.only(left: index == 0 ? 0 : 17),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 22,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.bluuue,
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow:
                      ),
                      child: Text(
                        "4H",
                        style: context.style.fontSize15Weight900,
                      ),
                    );
                  }),
                ],
              ),
              const Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(2, (index) {
                    return Container(
                      margin: EdgeInsets.only(left: index == 0 ? 0 : 17),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 22,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.bluuue,
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow:
                      ),
                      child: Text(
                        "4H",
                        style: context.style.fontSize15Weight900,
                      ),
                    );
                  }),
                ],
              ),
              const Gap(25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(1, (index) {
                    return Container(
                      margin: EdgeInsets.only(left: index == 0 ? 0 : 17),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 22,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.bluuue,
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow:
                      ),
                      child: SvgPicture.asset(context.icon.vip),
                    );
                  }),
                ],
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 56,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF232323),
                    ),
                    child: Text(
                      "back",
                      style: context.style.fontSize15Weight900.copyWith(
                        color: context.colors.white,
                      ),
                    ),
                  ),
                  GestureDetector( 
                    onTap: () {
                      serviceLocator<SharedPreferences>().clear();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 56,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF232323),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF03B3EB), Color(0xFF066D8E)],
                        ),
                      ),
                      child: Text(
                        "crate",
                        style: context.style.fontSize15Weight900.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
