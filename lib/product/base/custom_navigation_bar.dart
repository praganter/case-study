import 'package:case_study/core/utils/custom_router.dart';
import 'package:case_study/product/constats/page_routes_constants.dart';
import 'package:flutter/material.dart';

import '../constats/string_constants.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({required this.currentIndex, super.key});
  final int currentIndex;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) {
        setState(() {
          if (index == 0 && widget.currentIndex != index) {
            CustomRouter.pushNamedRemoveUntil(PageRoutesConstant.homeScreenPath);
          }
          if (index == 1 && widget.currentIndex != index) {
            CustomRouter.pushNamedRemoveUntil(PageRoutesConstant.programPath);
          }
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: StringConstants.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: StringConstants.program,
        ),
      ],
    );
  }
}
