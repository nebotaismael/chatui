// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  final String url;
  const Story({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 76,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 2, color: Color(0xFFD2D5F9)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 4,
                      top: 4,
                      child: Container(
                        width: 48,
                        height: 48,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(url),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Midala Hu...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0F1828),
                    fontSize: 10,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    height: 0.16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
