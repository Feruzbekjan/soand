import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
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
      resizeToAvoidBottomInset: true,
      body: widget.statefulNavigationShell,
      // floatingActionButton: SpeedDial(
      //   animatedIcon: AnimatedIcons.menu_close,
      //   children: [
      //     SpeedDialChild(
      //       child: Icon(Icons.add),
      //       label: 'Qoʻshish',
      //       onTap: () => print('Qoʻshish bosildi'),
      //     ),
      //     SpeedDialChild(
      //       child: Icon(Icons.edit),
      //       label: 'Tahrirlash',
      //       onTap: () => print('Tahrirlash bosildi'),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.paddingOf(context).bottom + 8,
        ),
        child: Builder(
          builder: (context) {
            return Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      widget.statefulNavigationShell.goBranch(
                        index,
                        initialLocation:
                            widget.statefulNavigationShell.currentIndex == index,
                      );
                    },
                    child: NavigationItem(
                      context: context,
                      index: index,
                      selectedIndex: widget.statefulNavigationShell.currentIndex,
                    ),
                  );
                }),
              ),
            );
          },
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
