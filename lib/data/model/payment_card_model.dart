class PaymentCardModel {
  String? cardNumber;
  String? expiryDate;
  String? cardHolderName;
  String? cvvCode;

  PaymentCardModel({
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) {
    return PaymentCardModel(
      cardNumber: json['card_number'] as String?,
      expiryDate: json['expiry_date'] as String?,
      cardHolderName: json['card_holder_name'] as String?,
      cvvCode: json['cvv_code'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'card_number': cardNumber,
        'expiry_date': expiryDate,
        'card_holder_name': cardHolderName,
        'cvv_code': cvvCode,
      };
}
