import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/provider/payment_card_provider/payment_card_provider.dart';

class AddCardWidget extends ConsumerWidget {
  const AddCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(paymentCardProvider.notifier);
    ref.watch(paymentCardProvider);
    return Column(
      children: [
        SizedBox(height: 150.h),
        CreditCardWidget(
          cardNumber: provider.cardNumber,
          expiryDate: provider.expiryDate,
          cardHolderName: provider.cardHolderName,
          cvvCode: provider.cvvCode,
          bankName: 'Bank Card',
          showBackView: provider.isCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          cardBgColor: Colors.black,
          isSwipeGestureEnabled: true,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
          customCardTypeIcons: const <CustomCardTypeIcon>[],
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CreditCardForm(
                  formKey: provider.cardFormKey,
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumber: provider.cardNumber,
                  cvvCode: provider.cvvCode,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  cardHolderValidator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please Enter Card Holder";
                    }
                    return null;
                  },
                  cardHolderName: provider.cardHolderName,
                  expiryDate: provider.expiryDate,
                  inputConfiguration: InputConfiguration(
                    cardNumberDecoration: decoration(
                        labelText: 'Number', hintText: 'XXXX XXXX XXXX XXXX'),
                    expiryDateDecoration: decoration(
                        labelText: 'Expired Date', hintText: 'XX/XX'),
                    cvvCodeDecoration:
                        decoration(labelText: 'CVV', hintText: 'XXX'),
                    cardHolderDecoration: decoration(
                      labelText: 'Card Holder',
                    ),
                  ),
                  onCreditCardModelChange: provider.onCreditCardModelChange,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: AppColors.green
                      // backgroundColor: const Color(0xff1b447b),
                      ),
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'halter',
                        fontSize: 14,
                        package: 'flutter_credit_card',
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await provider.addUserCard();
                  },
                ),
                SizedBox(height: 20.h)
              ],
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration decoration({String? labelText, String? hintText}) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black),
      labelStyle: const TextStyle(color: Colors.black),
      border: const OutlineInputBorder(borderSide: BorderSide(width: 2)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.green, width: 2)),
      // enabledBorder: const OutlineInputBorder(
      //     borderSide: BorderSide(color: Colors.black, width: 2)),
    );
  }
}
