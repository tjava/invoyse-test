import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';
import 'package:invoyse_test/core/widgets/generic_text.dart';

class PicCircle extends StatelessWidget {
  final String name;
  final bool formList;
  const PicCircle({
    Key? key,
    required this.name,
    this.formList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newName = name.split(' ');
    return Container(
      height: 53.sp,
      width: 53.sp,
      decoration: BoxDecoration(color: formList ? black : white, shape: BoxShape.circle),
      child: Center(
        child: GenericText(
          text: newName.length < 2
              ? newName[0][0].toUpperCase()
              : '${newName[0][0].toUpperCase()}${newName[1][0].toUpperCase()}',
          size: 17.sp,
          weight: FontWeight.w700,
          color: formList ? white : black,
        ),
      ),
    );
  }
}
