import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/widget/custom_toast.dart';
import 'package:green_taxi/provider/payment_card_provider/payment_card_provider.dart';
import 'package:green_taxi/view/widgets/payment_card_widget/add_card_widget.dart';
import 'package:green_taxi/view/widgets/payment_card_widget/top_green_mask.dart';

@RoutePage()
class AddCardPage extends ConsumerWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(paymentCardProvider, (previous, next) {
      if (next is AddCardError) {
        Toast.errorToast(context, message: next.message);
      }
      if (next is AddCardSuccess) {
        Toast.successToast(context, message: "Payment Card Successfully Added");
      }
    });
    return const Scaffold(
      body: Stack(
        children: [
          TopGreenMask(title: AppStrings.addCreditCard),
          AddCardWidget()
        ],
      ),
    );
  }
}
