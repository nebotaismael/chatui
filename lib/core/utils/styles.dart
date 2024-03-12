import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppStyles {
  static const TextStyle bottomNav = TextStyle();
  static const TextStyle appBar = TextStyle();
  static const TextStyle body = TextStyle();
  static const TextStyle title = TextStyle();
  static TextStyle hint = TextStyle(
    fontSize: 18.sp,
  );
  static TextStyle forgotPassword = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 13.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primaryColor,
  );
}
