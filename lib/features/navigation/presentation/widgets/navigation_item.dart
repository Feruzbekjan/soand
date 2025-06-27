// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:soand/core/extension/extension.dart';

class NavigationItem extends StatelessWidget {
  final BuildContext context;
  final int index;
  final int selectedIndex;
  const NavigationItem({
    super.key,
    required this.context,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "home",
          style: context.style.fontSize13Weight400.copyWith(
            color: selectedIndex == index
                ? context.colors.black
                : context.colors.gray500,
          ),
        ),
        SizedBox(
          height: 20,
          child: Icon(Icons.home),
          //  SvgPicture.asset(
          //   selectedIndex == index ? _getFullIcon(index) : _getIcon(index),
          // ),
        ),
      ],
    );
  }

  // String _getlabel(int index, BuildContext context) {
  //   switch (index) {
  //     case 0:
  //       return context.tr(LocaleKeys.asosiy);
  //     case 1:
  //       return context.tr(LocaleKeys.buyurmalar);
  //     case 2:
  //       return context.tr(LocaleKeys.katalog);
  //     // case 2:
  //     //   return context.tr(LocaleKeys.suhbat);
  //     default:
  //       return context.tr(LocaleKeys.profil);
  //   }
  // }

  // String _getIcon(int index) {
  //   switch (index) {
  //     case 0:
  //       return AppIcons().homeOutline;
  //        case 1:
  //       return AppIcons().orderOutline;
  //     case 2:
  //       return AppIcons().catalogOutline;
  //     // case 2:
  //     //   return AppIcons().chatOutline;
  //     default:
  //       return AppIcons().profileOutline;
  //   }
  // }

  // String _getFullIcon(int index) {
  //   switch (index) {
  //     case 0:
  //       return AppIcons().homeFull;
  //     case 1:
  //       return AppIcons().orderFull;
  //     case 2:
  //       return AppIcons().catalogFull;
  //     // case 2:
  //     //   return AppIcons().chatFull;
  //     default:
  //       return AppIcons().profile;
  //   }
  // }
}
