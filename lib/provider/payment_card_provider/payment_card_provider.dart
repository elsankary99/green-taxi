import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'payment_card_state.dart';

final paymentCardProvider =
    StateNotifierProvider<PaymentCardProvider, PaymentCardState>(
        (ref) => PaymentCardProvider());

class PaymentCardProvider extends StateNotifier<PaymentCardState> {
  PaymentCardProvider() : super(PaymentCardInitial());
}
