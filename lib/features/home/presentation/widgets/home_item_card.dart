import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';
import 'package:invoyse_test/core/widgets/generic_text.dart';

class HomeItemCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const HomeItemCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: GenericText(
          text: title,
          size: 16.sp,
          weight: FontWeight.w700,
          color: deepGrey,
        ),
        subtitle: GenericText(
          text: subTitle,
          size: 12.sp,
          weight: FontWeight.w400,
          color: deepGrey,
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: 30.sp,
          color: deepGrey,
        ),
      ),
    );
  }
}
