import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'main_screen.dart';

class ScreensExample extends StatefulWidget {
  const ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  State<ScreensExample> createState() => _ScreensState();
}

class _ScreensState extends State<ScreensExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(widget.controller.selectedIndex);
        switch (widget.controller.selectedIndex) {
          case 0:
            return const MainScreen();
          case 1:

          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Главная';
    case 1:
      return 'Добавить вопрос для бота';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}
