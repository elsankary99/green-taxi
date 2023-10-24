import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/router/app_router.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/core/widget/custom_toast.dart';
import 'package:green_taxi/provider/login_provider/login_provider.dart';

class CustomTextFormField extends ConsumerWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    ref.listen(
      loginProvider,
      (previous, next) {
        if (next is PhoneNumberSubmitted) {
          context.router.push(const OTPRoute());
          Toast.successToast(context,
              message: "We Send Sms Code To your Number");
        }
        if (next is LoginError) {
          Toast.errorToast(context, message: next.message);
        }
      },
    );
    return Form(
      key: provider.loginFormKey,
      child: Row(
        children: [
          SizedBox(width: context.width * 0.02),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return AppStrings.pleaseEnterYourPhoneErr;
                }
                if (value.trim().length < 10) {
                  return AppStrings.phoneNumberDigitErr;
                }
                return null;
              },
              onSaved: (phoneNumber) {
                provider.phoneNumber = phoneNumber!.trim();
              },
              decoration: InputDecoration(
                  suffixIcon: state is LoginLoading
                      ? SizedBox(
                          width: 25.w,
                          child: const CustomCircleIndicator(
                            color: AppColors.green,
                          ),
                        )
                      : IconButton(
                          onPressed: () async {
                            await provider.verifyPhoneNumber();
                          },
                          icon: CircleAvatar(
                            backgroundColor: AppColors.green,
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14.h,
                  ),
                  hintText: AppStrings.enterMobileNumber,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.green, width: 2)),
                  border: const OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
