import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';
import 'package:invoyse_test/core/utils/snack_bar.dart';
import 'package:invoyse_test/core/widgets/column_sized_box.dart';
import 'package:invoyse_test/core/widgets/generic_text.dart';
import 'package:invoyse_test/features/home/presentation/cubits/get_businesses/get_businesses_cubit.dart';
import 'package:invoyse_test/features/home/presentation/widgets/pic_circle.dart';
import 'package:invoyse_test/locator/locate.dart';
import 'package:invoyse_test/navigator/router.gr.dart';

class SwitchBusiness extends StatefulWidget {
  const SwitchBusiness({super.key});

  @override
  State<SwitchBusiness> createState() => _SwitchBusinessState();
}

class _SwitchBusinessState extends State<SwitchBusiness> {
  late GetBusinessesCubit _getBusinessesCubit;

  @override
  void initState() {
    super.initState();
    _getBusinessesCubit = locate<GetBusinessesCubit>();
    _getBusinessesCubit.getBusinesses();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getBusinessesCubit,
      child: BlocConsumer<GetBusinessesCubit, GetBusinessesState>(
        listener: (context, state) {
          if (state is LoadingBusinessesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(
                context: context,
                message: state.message,
                color: red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColumnSizedBox(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        GenericText(
                          text: 'Switch business',
                          size: 18.sp,
                          weight: FontWeight.w600,
                          color: black,
                        ),
                        InkWell(
                          onTap: () => context.popRoute(),
                          child: Icon(
                            Icons.close,
                            color: black,
                            size: 24.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  if (state is LoadedBusinesses) ...[
                    if (state.businesses.isEmpty) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: GenericText(
                            text: 'No Account Yet.',
                            size: 19.sp,
                            weight: FontWeight.w700,
                            color: black,
                          ),
                          onTap: () => context.pushRoute(const AddBusinessRoute()),
                        ),
                      ),
                    ] else ...[
                      ListView.separated(
                        itemCount: state.businesses.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: PicCircle(
                                name: state.businesses[index].businessName,
                                formList: true,
                              ),
                              title: GenericText(
                                text: state.businesses[index].businessName,
                                size: 19.sp,
                                weight: FontWeight.w700,
                                color: black,
                              ),
                              subtitle: GenericText(
                                text: state.businesses[index].businessAddress,
                                size: 13.sp,
                                weight: FontWeight.w400,
                                color: black,
                              ),
                              trailing: index == state.businesses.length - 1
                                  ? Icon(
                                      Icons.check_circle,
                                      size: 30.sp,
                                      color: black,
                                    )
                                  : const SizedBox(),
                              onTap: () {},
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          color: dividerGrey,
                          height: 2.h,
                          thickness: 1,
                        ),
                      ),
                    ],
                    Divider(
                      color: dividerGrey,
                      height: 2.h,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 53.sp,
                          width: 53.sp,
                          decoration: const BoxDecoration(color: black, shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            size: 25.sp,
                            color: white,
                          ),
                        ),
                        title: GenericText(
                          text: 'Add Account',
                          size: 19.sp,
                          weight: FontWeight.w700,
                          color: black,
                        ),
                        onTap: () => context.pushRoute(const AddBusinessRoute()),
                      ),
                    ),
                  ] else ...[
                    const SizedBox(),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
