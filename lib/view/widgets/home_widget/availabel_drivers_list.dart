import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/provider/driver_provider/driver_provider.dart';
import 'package:green_taxi/view/widgets/home_widget/driver_card.dart';

class AvailableDriverList extends ConsumerWidget {
  const AvailableDriverList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(driverProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
          child: Text(
            AppStrings.selectAnOption,
            style: AppTextStyle.poppinsBold18,
          ),
        ),
        SizedBox(
            height: context.height * 0.16,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      provider.selectDriver(index);
                    },
                    child: DriverCard(
                      index: index,
                    ));
              },
            )),
      ],
    );
  }
}
