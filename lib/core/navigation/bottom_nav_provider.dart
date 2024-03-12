import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  late TabsRouter tabsRouter;

  void init(BuildContext context) {
    tabsRouter = AutoTabsRouter.of(context);
    if (firstTime) {
      tabsRouter.setActiveIndex(1);
      firstTime = false;
      notifyListeners();
    }
  }

  bool firstTime = true;

  int currentIndex = 1;
  void onIndexChange(int index) {
    currentIndex = index;
    tabsRouter.setActiveIndex(index);
    notifyListeners();
  }
}
