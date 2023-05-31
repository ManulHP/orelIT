import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appColors.dart';

TextStyle kPoppinsFont22(BuildContext context, {Color color = kColorBlack}) => TextStyle(
    color: color,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: 22.sp);

TextStyle kPoppinsFont14(BuildContext context) => TextStyle(
    color: kColorBlack,
    fontWeight: FontWeight.w300,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: 14.sp);

TextStyle kPoppinsFont12(BuildContext context, {Color color = kColorBlack}) => TextStyle(
    color: color,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: 12.sp);