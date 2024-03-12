import 'package:chatui/core/utils/popmenu.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget TopBar(BuildContext context, String text) {
  return AppBar(
    title: Text(text),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          // Implement search functionality
        },
      ),
      Builder(
          builder: ((context) => ScaffoldMessenger(
                  child: IconButton(
                onPressed: () {
                  const AppDrawer2();
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
                  child: const Icon(Icons.person_2_rounded,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ))))
    ],
  );
}
