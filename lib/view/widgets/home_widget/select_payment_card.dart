import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/core/widget/custom_toast.dart';
import 'package:green_taxi/provider/driver_provider/driver_provider.dart';
import 'package:green_taxi/provider/payment_card_provider/payment_card_provider.dart';

class SelectPaymentCard extends ConsumerWidget {
  const SelectPaymentCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(driverProvider.notifier);
    ref.watch(driverProvider);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: const Divider(thickness: 1),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Assets.assetsImagesVisa,
                  height: context.height * 0.065,
                ),
                ref.watch(getPaymentCardsProvider).when(
                      data: (data) => DropdownButton(
                        hint: data.isEmpty
                            ? const Text('add payment card')
                            : null,
                        value: data.isEmpty
                            ? 'add payment card'
                            : provider.selectedCard ?? data[0].cardNumber!,
                        style: AppTextStyle.poppinsRegular14,
                        items: data.isEmpty
                            ? null
                            : List.generate(
                                data.length,
                                (index) => DropdownMenuItem<String>(
                                      value: data[index].cardNumber,
                                      child: Text(data[index].cardNumber!),
                                    )).toList(),
                        onChanged: (value) {
                          provider.selectPaymentCard(value!);
                        },
                      ),
                      loading: () =>
                          const CustomCircleIndicator(color: AppColors.green),
                      error: (error, stackTrace) =>
                          Center(child: Text(error.toString())),
                    ),
                ElevatedButton(
                  onPressed: () {
                    context.router.pop();
                    Toast.successToast(context,
                        message: "Order send To Taxi Driver");
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: AppColors.green),
                  child: const Text(AppStrings.confirm),
                )
              ],
            )),
      ],
    );
  }

  String obfuscateText(String text) {
    final visibleDigits = text.substring(text.length - 4);
    final obfuscatedDigits = '*' * (text.length - 4);
    return obfuscatedDigits + visibleDigits;
  }
}
