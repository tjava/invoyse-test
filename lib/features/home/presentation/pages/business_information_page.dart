import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';
import 'package:invoyse_test/core/utils/uuid_generator.dart';
import 'package:invoyse_test/core/widgets/column_sized_box.dart';
import 'package:invoyse_test/core/widgets/generic_button.dart';
import 'package:invoyse_test/core/widgets/generic_text.dart';
import 'package:invoyse_test/core/widgets/generic_text_form_field.dart';
import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';
import 'package:invoyse_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class BusinessInformationPage extends StatefulWidget {
  const BusinessInformationPage({super.key});

  @override
  State<BusinessInformationPage> createState() => _BusinessInformationPageState();
}

class _BusinessInformationPageState extends State<BusinessInformationPage> {
  late TextEditingController _businessNameController;
  late TextEditingController _businessEmailController;
  late TextEditingController _businessPhoneController;
  late TextEditingController _businessAddressController;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _isValidated = false;

  @override
  void initState() {
    super.initState();
    _businessNameController = TextEditingController();
    _businessEmailController = TextEditingController();
    _businessPhoneController = TextEditingController();
    _businessAddressController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _businessEmailController.dispose();
    _businessPhoneController.dispose();
    _businessAddressController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onValidation() {
    if (_businessNameController.text.isEmpty ||
        _businessEmailController.text.isEmpty ||
        _businessPhoneController.text.isEmpty ||
        _businessAddressController.text.isEmpty) {
      _isValidated = false;
    } else {
      _isValidated = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ColumnSizedBox(20.h),
            Image.asset('assets/images/info.png'),
            ColumnSizedBox(15.h),
            GenericText(
              text: 'Business Information.',
              size: 18.sp,
              weight: FontWeight.w600,
              color: black,
            ),
            ColumnSizedBox(10.h),
            GenericText(
              text: 'Create your business profile.',
              size: 14.sp,
              weight: FontWeight.w400,
              color: black,
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
                      label: 'Business name',
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                      inputType: TextInputType.text,
                      isRequired: true,
                      onChanged: (val) => onValidation(),
                      onEditingComplete: () => _focusNode.nextFocus(),
                      editingController: _businessNameController,
                    ),
                    ColumnSizedBox(20.h),
                    GenericTextFormField(
                      label: 'Business email address',
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                      inputType: TextInputType.emailAddress,
                      isRequired: true,
                      onChanged: (val) => onValidation(),
                      onEditingComplete: () => _focusNode.nextFocus(),
                      editingController: _businessEmailController,
                    ),
                    ColumnSizedBox(20.h),
                    GenericTextFormField(
                      label: 'Business Phone number',
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                      inputType: TextInputType.number,
                      isRequired: true,
                      onChanged: (val) => onValidation(),
                      onEditingComplete: () => _focusNode.nextFocus(),
                      editingController: _businessPhoneController,
                    ),
                    ColumnSizedBox(20.h),
                    GenericTextFormField(
                      label: 'Business address',
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                      inputType: TextInputType.text,
                      isRequired: true,
                      onChanged: (val) => onValidation(),
                      onEditingComplete: () => _focusNode.nextFocus(),
                      editingController: _businessAddressController,
                    ),
                    ColumnSizedBox(20.h),
                    GenericButton(
                      label: 'Next',
                      labelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: white,
                      ),
                      backgroundColor: _isValidated ? black : black.withOpacity(.0),
                      height: 35.h,
                      width: 207.w,
                      onClick: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.pushRoute(BusinessBrandingRoute(
                            businessInfoEntity: BusinessInfoEntity(
                              uuid: generateUuid(),
                              businessName: _businessNameController.text,
                              businessEmail: _businessEmailController.text,
                              businessPhone: _businessPhoneController.text,
                              businessAddress: _businessAddressController.text,
                            ),
                          ));
                        }
                      },
                    ),
                    ColumnSizedBox(20.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
