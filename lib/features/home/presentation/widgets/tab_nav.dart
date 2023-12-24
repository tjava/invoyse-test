import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';

class TabNav extends StatelessWidget {
  final TabController controller;

  const TabNav({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      color: white,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.popRoute(),
            child: Icon(
              Icons.arrow_back,
              color: black,
              size: 24.sp,
            ),
          ),
          Expanded(
            child: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: black,
              controller: controller,
              labelPadding: EdgeInsets.zero,
              tabs: [
                Container(
                  margin: EdgeInsets.only(left: 115.w),
                  height: 3.h,
                  width: 33.w,
                  decoration: BoxDecoration(
                    color: controller.index == 0 ? black : tabGrey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 115.w),
                  height: 3.h,
                  width: 33.w,
                  decoration: BoxDecoration(
                    color: controller.index == 1 ? black : tabGrey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
