import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soand/core/extension/extension.dart';
import 'package:soand/features/navigation/presentation/widgets/navigation_item.dart';

class NavigationScreen extends StatefulWidget {
  final StatefulNavigationShell statefulNavigationShell;
  const NavigationScreen({super.key, required this.statefulNavigationShell});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late final ValueNotifier<int> selectedPageIndex;
  @override
  void initState() {
    selectedPageIndex = ValueNotifier(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SafeArea(bottom: false, child: widget.statefulNavigationShell),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        // color: Colors.transparent,
        child: SafeArea(
          minimum: const EdgeInsets.only(bottom: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: context.colors.black202020,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(90),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(90),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(3, (index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        widget.statefulNavigationShell.goBranch(
                          index,
                          initialLocation:
                              widget.statefulNavigationShell.currentIndex ==
                              index,
                        );
                      },
                      child: NavigationItem(
                        context: context,
                        index: index,
                        selectedIndex:
                            widget.statefulNavigationShell.currentIndex,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),

      //  ValueListenableBuilder(
      //   valueListenable: selectedPageIndex,
      //   builder: (context, value, child) {
      //     return Padding(
      //       padding:  EdgeInsets.only(bottom:MediaQuery.paddingOf(context).bottom +8 ),
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: List.generate(
      //             4,
      //             (index) {
      //               return GestureDetector(
      //                 behavior: HitTestBehavior.opaque,
      //                 onTap: () {
      //                   widget.statefulNavigationShell.goBranch(index,
      //                       initialLocation:
      //                           widget.statefulNavigationShell.currentIndex ==
      //                               index);
      //                 },
      //                 child: NavigationItem(
      //                   context: context,
      //                   index: index,
      //                   selectedIndex: widget.statefulNavigationShell.currentIndex,
      //                 ),
      //               );
      //             },
      //           )),
      //     );
      //   },
      // ),
    );
  }

  @override
  void dispose() {
    selectedPageIndex.dispose();
    super.dispose();
  }
}
