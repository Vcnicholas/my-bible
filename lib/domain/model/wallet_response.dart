class WalletResponse {
  final String message;
  final Wallet wallet;

  WalletResponse({required this.message, required this.wallet});

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      message: json['message'],
      wallet: Wallet.fromJson(json['wallet']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'wallet': wallet,
    };
  }
}

class Wallet {
  final String id;
  final String user;
  final int v;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SolWallet solWallet;
  final UsdWallet usdWallet;

  Wallet({
    required this.id,
    required this.user,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.solWallet,
    required this.usdWallet,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['_id'],
      user: json['user'],
      v: json['__v'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      solWallet: SolWallet.fromJson(json['solWallet']),
      usdWallet: UsdWallet.fromJson(json['usdWallet']),
    );
  }
  Map<String, dynamic> toJson() => {
    '_id': id,
    'user': user,
    '__v': v,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'solWallet': solWallet.toJson(),
    'usdWallet': usdWallet.toJson(),
  };

}

class SolWallet {
  final String id;
  final String uuid;
  final int v;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String address;

  SolWallet({
    required this.id,
    required this.uuid,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
  });

  factory SolWallet.fromJson(Map<String, dynamic> json) {
    return SolWallet(
      id: json['_id'],
      uuid: json['id'],
      v: json['__v'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      address: json['address'],
    );
  }
  Map<String, dynamic> toJson() => {
    '_id': id,
    'id': uuid,
    '__v': v,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'address': address,
  };

}

class UsdWallet {
  final String id;
  final String uuid;
  final String user;
  final String status;
  final String customerId;
  final String developerFeePercent;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final SourceDepositInstructions sourceDepositInstructions;
  final Destination destination;

  UsdWallet({
    required this.id,
    required this.uuid,
    required this.user,
    required this.status,
    required this.customerId,
    required this.developerFeePercent,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.sourceDepositInstructions,
    required this.destination,
  });

  factory UsdWallet.fromJson(Map<String, dynamic> json) {
    return UsdWallet(
      id: json['_id'],
      uuid: json['id'],
      user: json['user'],
      status: json['status'],
      customerId: json['customer_id'],
      developerFeePercent: json['developer_fee_percent'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
      sourceDepositInstructions: SourceDepositInstructions.fromJson(json['source_deposit_instructions']),
      destination: Destination.fromJson(json['destination']),
    );
  }
  Map<String, dynamic> toJson() => {
    '_id': id,
    'id': uuid,
    'user': user,
    'status': status,
    'customer_id': customerId,
    'developer_fee_percent': developerFeePercent,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    '__v': v,
    'source_deposit_instructions': sourceDepositInstructions.toJson(),
    'destination': destination.toJson(),
  };

}

class SourceDepositInstructions {
  final String currency;
  final String bankBeneficiaryName;
  final String bankName;
  final String bankAddress;
  final String bankRoutingNumber;
  final String bankAccountNumber;
  final List<String> paymentRails;
  final String paymentRail;

  SourceDepositInstructions({
    required this.currency,
    required this.bankBeneficiaryName,
    required this.bankName,
    required this.bankAddress,
    required this.bankRoutingNumber,
    required this.bankAccountNumber,
    required this.paymentRails,
    required this.paymentRail,
  });

  factory SourceDepositInstructions.fromJson(Map<String, dynamic> json) {
    return SourceDepositInstructions(
      currency: json['currency'],
      bankBeneficiaryName: json['bank_beneficiary_name'],
      bankName: json['bank_name'],
      bankAddress: json['bank_address'],
      bankRoutingNumber: json['bank_routing_number'],
      bankAccountNumber: json['bank_account_number'],
      paymentRails: List<String>.from(json['payment_rails']),
      paymentRail: json['payment_rail'],
    );
  }
  Map<String, dynamic> toJson() => {
    'currency': currency,
    'bank_beneficiary_name': bankBeneficiaryName,
    'bank_name': bankName,
    'bank_address': bankAddress,
    'bank_routing_number': bankRoutingNumber,
    'bank_account_number': bankAccountNumber,
    'payment_rails': paymentRails,
    'payment_rail': paymentRail,
  };

}

class Destination {
  final String currency;
  final String paymentRail;
  final String address;

  Destination({
    required this.currency,
    required this.paymentRail,
    required this.address,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      currency: json['currency'],
      paymentRail: json['payment_rail'],
      address: json['address'],
    );
  }
  Map<String, dynamic> toJson() => {
    'currency': currency,
    'payment_rail': paymentRail,
    'address': address,
  };

}
