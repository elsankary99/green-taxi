import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class CardsListWidget extends ConsumerWidget {
  const CardsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.22),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => CreditCardWidget(
              cardNumber: "4000000000000000",
              expiryDate: "3212",
              cardHolderName: "Ahmed",
              cvvCode: "351",
              showBackView: false,
              cardBgColor:
                  Colors.black, //true when you want to show cvv(back) view
              onCreditCardWidgetChange: (CreditCardBrand
                  brand) {}, // Callback for anytime credit card brand is changed
            ),
          ),
        ),
      ],
    );
  }
}
