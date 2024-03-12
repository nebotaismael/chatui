import 'package:auto_route/auto_route.dart';
import 'package:chatui/core/navigation/approuter.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WalkthroughLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: 375,
              height: 812,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: 47,
                    top: 250,
                    child: SizedBox(
                      width: 280,
                      child: Text(
                        'Connect easily with your family and friends over countries',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0F1828),
                          fontSize: 24,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 113,
                    top: 360,
                    child: Text(
                      'Terms & Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0F1828),
                        fontSize: 14,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                        height: 0.12,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 500,
                    child: GestureDetector(
                      onTap: () {
                        navigate('verify');
                      },
                      child: Container(
                        width: 327,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48, vertical: 25),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF002DE3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Messaging',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF7F7FC),
                                fontSize: 16,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w600,
                                height: 0.11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 375,
                      height: 90,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 13),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            //  width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 6, right: 21),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '9:41',
                                        style: TextStyle(
                                          color: Color(0xFF0F1828),
                                          fontSize: 15,
                                          fontFamily: 'Segoe UI',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //  const SizedBox(width: 260),
                                Container(
                                  width: 67,
                                  height: 11.50,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: const Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: -0.02,
                                        child: SizedBox(
                                          width: 67,
                                          height: 11.54,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 42.48,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 24.52,
                                                  height: 11.54,
                                                  child: Stack(children: []),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
