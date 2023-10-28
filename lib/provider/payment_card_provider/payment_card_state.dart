part of 'payment_card_provider.dart';

abstract class PaymentCardState {
  const PaymentCardState();
}

class PaymentCardInitial extends PaymentCardState {}

//? Add Card
class AddCardLoading extends PaymentCardState {}

class AddCardSuccess extends PaymentCardState {}

class AddCardError extends PaymentCardState {
  final String message;
  const AddCardError(this.message);
}

class OnCreditCardModelChange extends PaymentCardState {}
