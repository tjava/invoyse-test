import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';
import 'package:invoyse_test/core/utils/snack_bar.dart';
import 'package:invoyse_test/core/widgets/column_sized_box.dart';
import 'package:invoyse_test/core/widgets/generic_button.dart';
import 'package:invoyse_test/core/widgets/generic_rich_text.dart';
import 'package:invoyse_test/core/widgets/generic_text.dart';
import 'package:invoyse_test/core/widgets/generic_text_form_field.dart';
import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';
import 'package:invoyse_test/features/home/presentation/cubits/create_business/create_business_cubit.dart';

@RoutePage<dynamic>()
class BusinessBrandingPage extends StatefulWidget {
  final BusinessInfoEntity? businessInfoEntity;
  const BusinessBrandingPage({super.key, this.businessInfoEntity});

  @override
  State<BusinessBrandingPage> createState() => _BusinessBrandingPageState();
}

class _BusinessBrandingPageState extends State<BusinessBrandingPage> {
  late TextEditingController _businessNameController;
  late TextEditingController _businessCategoryController;
  late TextEditingController _businessNairaController;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
    _businessNameController = TextEditingController();
    _businessCategoryController = TextEditingController();
    _businessNairaController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _businessCategoryController.dispose();
    _businessNairaController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateBusinessCubit, CreateBusinessState>(
      listener: (context, state) {
        if (state is CreatingBusinesses) {
          _isBusy = true;
        } else {
          _isBusy = false;
        }

        if (state is CreatingBusinessesError) {
          ScaffoldMessenger.of(context).showSnackBar(
            showSnackBar(
              context: context,
              message: state.message,
              color: red,
            ),
          );
        }

        if (state is CreatedBusinesses) {
          context.router.popUntilRoot();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ColumnSizedBox(20.h),
              Image.asset('assets/images/brand.png'),
              ColumnSizedBox(15.h),
              GenericText(
                text: 'Business Branding.',
                size: 18.sp,
                weight: FontWeight.w600,
                color: black,
              ),
              ColumnSizedBox(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.w),
                child: GenericRichText(
                  text: "Manage your business’s branding",
                  size: 14.sp,
                  weight: FontWeight.w400,
                  color: black,
                ),
              ),
              ColumnSizedBox(5.h),
              GenericText(
                text: '(All fields are optional.)',
                size: 10.sp,
                weight: FontWeight.w400,
                color: black,
              ),
              ColumnSizedBox(20.h),
              Form(
                key: _formKey,
                child: FocusScope(
                  node: _focusNode,
                  child: Column(
                    children: [
                      GenericTextFormField(
                        label: 'Upload Your Logo',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                        inputType: TextInputType.text,
                        isBusy: _isBusy,
                        suffixIcon: Image.asset('assets/images/logo.png'),
                        onEditingComplete: () => _focusNode.nextFocus(),
                        editingController: _businessNameController,
                      ),
                      ColumnSizedBox(20.h),
                      GenericTextFormField(
                        label: 'Business Category',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                        inputType: TextInputType.text,
                        suffixIcon: Image.asset('assets/images/category.png'),
                        isBusy: _isBusy,
                        onEditingComplete: () => _focusNode.nextFocus(),
                        editingController: _businessCategoryController,
                      ),
                      ColumnSizedBox(20.h),
                      GenericTextFormField(
                        label: 'NGN - Nigerian Naira (₦)',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                        inputType: TextInputType.number,
                        isBusy: _isBusy,
                        suffixIcon: Image.asset('assets/images/ngn.png'),
                        onEditingComplete: () => _focusNode.nextFocus(),
                        editingController: _businessNairaController,
                      ),
                      ColumnSizedBox(20.h),
                      GenericButton(
                        label: 'Create Your Invoice',
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: white,
                        ),
                        isBusy: _isBusy,
                        backgroundColor: black,
                        height: 35.h,
                        width: 207.w,
                        onClick: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            await context
                                .read<CreateBusinessCubit>()
                                .createBusiness(BusinessInfoEntity(
                                  uuid: widget.businessInfoEntity!.uuid,
                                  businessName: widget.businessInfoEntity!.businessName,
                                  businessEmail: widget.businessInfoEntity!.businessEmail,
                                  businessPhone: widget.businessInfoEntity!.businessPhone,
                                  businessAddress: widget.businessInfoEntity!.businessAddress,
                                  businessCategory: _businessCategoryController.text,
                                  businessNaira: _businessNairaController.text,
                                  createdAt: DateTime.now(),
                                ));
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
