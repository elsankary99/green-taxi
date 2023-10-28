import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/view/widgets/payment_card_widget/cards_list_widet.dart';
import 'package:green_taxi/view/widgets/payment_card_widget/go_adding_card.dart';
import 'package:green_taxi/view/widgets/payment_card_widget/top_green_mask.dart';

@RoutePage()
class MyCardsPage extends ConsumerWidget {
  const MyCardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Stack(
        children: [
          CardsListWidget(),
          TopGreenMask(title: AppStrings.myCards),
          Positioned(bottom: 0, child: GoAddingCard())
        ],
      ),
    );
  }
}
