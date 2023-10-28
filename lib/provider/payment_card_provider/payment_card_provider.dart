import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/data/model/payment_card_model.dart';

part 'payment_card_state.dart';

final getPaymentCardsProvider =
    FutureProvider<List<PaymentCardModel>>((ref) async {
  CollectionReference paymentCard = FirebaseFirestore.instance
      .collection('users')
      .doc("54asdsad35sdasca3sd54")
      .collection("payment_cards");
  final res = await paymentCard.get();
  final data = res.docs;
  return data
      .map((e) => PaymentCardModel.fromJson(e.data() as Map<String, dynamic>))
      .toList();
});

final paymentCardProvider =
    StateNotifierProvider<PaymentCardProvider, PaymentCardState>(
        (ref) => PaymentCardProvider());

class PaymentCardProvider extends StateNotifier<PaymentCardState> {
  PaymentCardProvider() : super(PaymentCardInitial());
  final GlobalKey<FormState> cardFormKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  //TODO: add UId
  CollectionReference paymentCard = FirebaseFirestore.instance
      .collection('users')
      .doc("54asdsad35sdasca3sd54")
      .collection("payment_cards");

  Future<void> addUserCard() async {
    if (cardFormKey.currentState!.validate()) {
      state = AddCardLoading();
      try {
        await paymentCard.add(
          {
            "card_number": cardNumber,
            "expiry_date": expiryDate,
            "card_holder_name": cardHolderName,
            "cvv_code": cvvCode,
          },
        );
        state = AddCardSuccess();
        resetValues();
      } catch (e) {
        state = AddCardError(e.toString());
      }
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    cardNumber = creditCardModel!.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
    state = OnCreditCardModelChange();
  }

  resetValues() {
    log("resetValues");
    cardNumber = '';
    expiryDate = '';
    cardHolderName = '';
    cvvCode = '';
  }
}
