import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/view/widgets/payment_card_widget/add_card_widget.dart';
import 'package:green_taxi/view/widgets/payment_card_widget/top_green_mask.dart';

@RoutePage()
class AddCardPage extends ConsumerWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Stack(
        children: [
          TopGreenMask(title: AppStrings.addCreditCard),
          AddCardWidget()
          // Positioned(bottom: 0, child: GoAddingCard())
        ],
      ),
    );
  }
}
