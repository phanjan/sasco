import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class custom_icon_navigation_bar extends StatelessWidget {
  const custom_icon_navigation_bar(
      {super.key,
      required this.imageIcon,
      required this.title,
        required this.color});

  final String imageIcon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          SvgPicture.asset(imageIcon),
          Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w700,
                color: color),
          )
        ],
      ),
    );
  }
}
