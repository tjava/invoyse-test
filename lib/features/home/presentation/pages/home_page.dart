import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';
import 'package:invoyse_test/core/widgets/generic_text.dart';
import 'package:invoyse_test/features/home/presentation/widgets/home_item_card.dart';
import 'package:invoyse_test/features/home/presentation/widgets/pic_circle.dart';
import 'package:invoyse_test/features/home/presentation/widgets/switch_business.dart';

@RoutePage<dynamic>()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: GenericText(
            text: 'Menu',
            size: 18.sp,
            weight: FontWeight.w700,
            color: black,
          ),
          centerTitle: true,
          backgroundColor: white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 79.h,
                color: black,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Center(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const PicCircle(name: 'James Son'),
                    title: GenericText(
                      text: 'James & Sons',
                      size: 19.sp,
                      weight: FontWeight.w700,
                      color: white,
                    ),
                    subtitle: GenericText(
                      text: 'Switch business',
                      size: 13.sp,
                      weight: FontWeight.w400,
                      color: white,
                      textDecoration: TextDecoration.underline,
                    ),
                    trailing: Icon(
                      Icons.expand_more,
                      size: 30.sp,
                      color: white,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                        ),
                        builder: (BuildContext context) {
                          return const SwitchBusiness();
                        },
                      );
                    },
                  ),
                ),
              ),
              const HomeItemCard(
                title: 'Business details',
                subTitle: 'Logo, Name, Contact information...',
              ),
              Divider(
                color: dividerGrey,
                height: 2.h,
                thickness: 1,
              ),
              const HomeItemCard(
                title: 'Quotations',
                subTitle: 'Quotation list, create quotations...',
              ),
              Divider(
                color: dividerGrey,
                height: 2.h,
                thickness: 1,
              ),
              const HomeItemCard(
                title: 'Manage staff',
                subTitle: 'Add, Manage, Delete...',
              ),
              Divider(
                color: dividerGrey,
                height: 2.h,
                thickness: 1,
              ),
              const HomeItemCard(
                title: 'Invoice templates',
                subTitle: 'Select templates, change colors...',
              ),
              Divider(
                color: dividerGrey,
                height: 2.h,
                thickness: 1,
              ),
              const HomeItemCard(
                title: 'Payment information',
                subTitle: 'Payment options, instructions...',
              ),
              Divider(
                color: dividerGrey,
                height: 2.h,
                thickness: 1,
              ),
              const HomeItemCard(
                title: 'Tax',
                subTitle: 'Tax options',
              ),
              Divider(
                color: dividerGrey,
                height: 2.h,
                thickness: 1,
              ),
              const HomeItemCard(
                title: 'Default notes',
                subTitle: 'Invoice notes, Estimate notes',
              ),
              Divider(
                color: dividerGrey,
                height: 2.h,
                thickness: 1,
              ),
              const HomeItemCard(
                title: 'Customization options',
                subTitle: 'Invoice no., Quantity label, Invoice title...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
