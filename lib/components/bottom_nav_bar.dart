import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'bottom_nav_menu.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBarState navBarState;

  @override
  State<StatefulWidget> createState() {
    navBarState = BottomNavBarState();
    return navBarState;
  }
}

class BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin<BottomNavBar> {
  AnimationController _hide;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizeTransition(
        sizeFactor: _hide,
        axisAlignment: -1.0,
        child: BottomAppBar(
          child: BottomNavigationMenu(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hide.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
    _hide.forward();
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }
}
