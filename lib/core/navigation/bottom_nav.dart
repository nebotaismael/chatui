import 'package:chatui/core/utils/colors.dart';
import 'package:chatui/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_provider.dart';

class BottomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = AppColors.primaryColor;
    paint.style = PaintingStyle.fill; // Change this to fill

    final path = Path();

    path.moveTo(0, 30.h);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 30.h);

    path.lineTo(size.width * 0.32, 30.h);

    path.quadraticBezierTo(size.width / 2, -40.h, size.width * 0.67, 30.h);

    path.lineTo(size.width * 0.35, 30.h);

    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.2))),
              child: const BarItems(),
            ),
          ),
        ],
      ),
    );
  }
}

class BarItems extends StatefulWidget {
  const BarItems({
    Key? key,
  }) : super(key: key);

  @override
  State<BarItems> createState() => _BarItemsState();
}

class _BarItemsState extends State<BarItems> {
  // final LocalStorage storage = LocalStorage('keys');

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (_, provider, __) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BarItem(
              icon: 'message',
              label: 'contacts',
              index: 0,
              setIndex: () => provider.onIndexChange(0),
              isActive: provider.currentIndex == 0,
            ),
            BarItem(
              icon: 'home',
              label: 'chats',
              index: 1,
              setIndex: () => provider.onIndexChange(1),
              isActive: provider.currentIndex == 1,
            ),
            BarItem(
              icon: 'profile',
              label: 'profile',
              index: 2,
              setIndex: () => provider.onIndexChange(2),
              isActive: provider.currentIndex == 2,
            ),
          ],
        ),
      );
    });
  }
}

class BarItemHover extends StatelessWidget {
  const BarItemHover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (_, provider, __) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...List.generate(
              5,
              (index) => SizedBox(
                width: 50,
                child: Center(
                  child: HoverItem(
                    isActive: provider.currentIndex == index,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class BarItem extends StatelessWidget {
  const BarItem({
    Key? key,
    required this.label,
    this.isActive = false,
    required this.icon,
    required this.index,
    required this.setIndex,
  }) : super(key: key);

  final String label;
  final bool isActive;
  final String icon;
  final int index;
  final Function() setIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: setIndex,
      child: SizedBox(
        height: 58,
        width: 50,
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/icons/$icon.svg',
                  height: 20,
                  width: 20,
                  color: isActive ? AppColors.primaryColor : Colors.black),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  label,
                  softWrap: false,
                  overflow: TextOverflow.clip,
                  style: AppStyles.bottomNav.copyWith(
                    color: isActive ? AppColors.primaryColor : Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HoverItem extends StatelessWidget {
  const HoverItem({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, -5),
                      blurRadius: 10,
                      color: isActive
                          ? AppColors.secondaryColor.withOpacity(0.5)
                          : Colors.transparent,
                      spreadRadius: 5),
                  BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                      color: isActive
                          ? AppColors.secondaryColor.withOpacity(0.1)
                          : Colors.transparent,
                      spreadRadius: 2)
                ],
                color: isActive
                    ? AppColors.secondaryColor.withOpacity(0.01)
                    : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            height: 5.w,
            width: 30.w,
            child: SizedBox(height: 5.h),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: isActive ? AppColors.secondaryColor : Colors.transparent,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          height: 5,
          width: 30,
          child: SizedBox(height: 5.h),
        ),
      ],
    );
  }
}

class BottomBarBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only(bottom: 0);

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    path.moveTo(rect.size.width * 0.9257803, rect.size.height * 0.2075680);
    path.lineTo(rect.size.width * 0.6396676, rect.size.height * 0.2075680);
    path.cubicTo(
        rect.size.width * 0.6202312,
        rect.size.height * 0.2075680,
        rect.size.width * 0.6014191,
        rect.size.height * 0.1808240,
        rect.size.width * 0.5882717,
        rect.size.height * 0.1316830);
    path.cubicTo(rect.size.width * 0.5666850, rect.size.height * 0.05101150,
        rect.size.width * 0.5348064, 0, rect.size.width * 0.4992688, 0);
    path.cubicTo(
        rect.size.width * 0.4637312,
        0,
        rect.size.width * 0.4318699,
        rect.size.height * 0.05101150,
        rect.size.width * 0.4102832,
        rect.size.height * 0.1316830);
    path.cubicTo(
        rect.size.width * 0.3971358,
        rect.size.height * 0.1808240,
        rect.size.width * 0.3783410,
        rect.size.height * 0.2075680,
        rect.size.width * 0.3589017,
        rect.size.height * 0.2075680);
    path.lineTo(rect.size.width * 0.07277601, rect.size.height * 0.2075680);
    path.cubicTo(
        rect.size.width * 0.03298526,
        rect.size.height * 0.2075680,
        rect.size.width * 0.0007225434,
        rect.size.height * 0.3181750,
        rect.size.width * 0.0007225434,
        rect.size.height * 0.4545910);
    path.lineTo(rect.size.width * 0.0007225434, rect.size.height * 0.7452540);
    path.cubicTo(
        rect.size.width * 0.0007225434,
        rect.size.height * 0.8817250,
        rect.size.width * 0.03298526,
        rect.size.height * 0.9923320,
        rect.size.width * 0.07279191,
        rect.size.height * 0.9923320);
    path.lineTo(rect.size.width * 0.9257803, rect.size.height * 0.9923320);
    path.cubicTo(
        rect.size.width * 0.9655694,
        rect.size.height * 0.9923320,
        rect.size.width * 0.9978324,
        rect.size.height * 0.8817250,
        rect.size.width * 0.9978324,
        rect.size.height * 0.7452540);
    path.lineTo(rect.size.width * 0.9978324, rect.size.height * 0.4545910);
    path.cubicTo(
        rect.size.width * 0.9978324,
        rect.size.height * 0.3181200,
        rect.size.width * 0.9655694,
        rect.size.height * 0.2075680,
        rect.size.width * 0.9257803,
        rect.size.height * 0.2075680);
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainterBottomNav extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.9257803, size.height * 0.2075680);
    path_0.lineTo(size.width * 0.6396676, size.height * 0.2075680);
    path_0.cubicTo(
        size.width * 0.6202312,
        size.height * 0.2075680,
        size.width * 0.6014191,
        size.height * 0.1808240,
        size.width * 0.5882717,
        size.height * 0.1316830);
    path_0.cubicTo(size.width * 0.5666850, size.height * 0.05101150,
        size.width * 0.5348064, 0, size.width * 0.4992688, 0);
    path_0.cubicTo(
        size.width * 0.4637312,
        0,
        size.width * 0.4318699,
        size.height * 0.05101150,
        size.width * 0.4102832,
        size.height * 0.1316830);
    path_0.cubicTo(
        size.width * 0.3971358,
        size.height * 0.1808240,
        size.width * 0.3783410,
        size.height * 0.2075680,
        size.width * 0.3589017,
        size.height * 0.2075680);
    path_0.lineTo(size.width * 0.07277601, size.height * 0.2075680);
    path_0.cubicTo(
        size.width * 0.03298526,
        size.height * 0.2075680,
        size.width * 0.0007225434,
        size.height * 0.3181750,
        size.width * 0.0007225434,
        size.height * 0.4545910);
    path_0.lineTo(size.width * 0.0007225434, size.height * 0.7452540);
    path_0.cubicTo(
        size.width * 0.0007225434,
        size.height * 0.8817250,
        size.width * 0.03298526,
        size.height * 0.9923320,
        size.width * 0.07279191,
        size.height * 0.9923320);
    path_0.lineTo(size.width * 0.9257803, size.height * 0.9923320);
    path_0.cubicTo(
        size.width * 0.9655694,
        size.height * 0.9923320,
        size.width * 0.9978324,
        size.height * 0.8817250,
        size.width * 0.9978324,
        size.height * 0.7452540);
    path_0.lineTo(size.width * 0.9978324, size.height * 0.4545910);
    path_0.cubicTo(
        size.width * 0.9978324,
        size.height * 0.3181200,
        size.width * 0.9655694,
        size.height * 0.2075680,
        size.width * 0.9257803,
        size.height * 0.2075680);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
