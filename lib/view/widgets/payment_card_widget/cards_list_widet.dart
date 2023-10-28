import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/provider/payment_card_provider/payment_card_provider.dart';

class CardsListWidget extends ConsumerWidget {
  const CardsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.22),
        Expanded(
            child: ref.watch(getPaymentCardsProvider).when(
                  data: (data) => data.isEmpty
                      ? Center(
                          child: Text(
                            "Add First Payment Card",
                            style: AppTextStyle.poppinsBold20,
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) => CreditCardWidget(
                            cardNumber: data[index].cardNumber!,
                            expiryDate: data[index].expiryDate!,
                            cardHolderName: data[index].cardHolderName!,
                            cvvCode: data[index].cvvCode!,
                            bankName: 'Bank Card',
                            showBackView: false,
                            isHolderNameVisible: true,
                            cardBgColor: Colors.black,
                            onCreditCardWidgetChange: (CreditCardBrand
                                brand) {}, // Callback for anytime credit card brand is changed
                          ),
                        ),
                  loading: () =>
                      const CustomCircleIndicator(color: AppColors.green),
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                )),
      ],
    );
  }
}
