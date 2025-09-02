// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soand/core/config/icons.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      decoration: selectedIndex == index
          ? BoxDecoration(
              color: context.colors.grey393939,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(90),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(90),
              ),
            )
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20, child: SvgPicture.asset(_getIcon(index))),
        ],
      ),
    );
  }

  String _getIcon(int index) {
    switch (index) {
      case 0:
        return AppIcons().global;
      case 1:
        return AppIcons().home;
      default:
        return AppIcons().profile;
    }
  }
}
