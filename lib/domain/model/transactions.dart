class Transaction {
  final List<Transactions> list;

  Transaction({required this.list});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      list: (json['list'] as List)
          .map((e) => Transactions.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'list': list.map((e) => e.toJson()).toList(),
  };
}

class Transactions {
  final String id;
  final String? clientReferenceId;
  final String state;
  final String onBehalfOf;
  final String currency;
  final double amount;
  final double developerFee;
  final Source source;
  final Destination destination;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SourceDepositInstructions sourceDepositInstructions;
  final Receipt receipt;

  Transactions({
    required this.id,
    this.clientReferenceId,
    required this.state,
    required this.onBehalfOf,
    required this.currency,
    required this.amount,
    required this.developerFee,
    required this.source,
    required this.destination,
    required this.createdAt,
    required this.updatedAt,
    required this.sourceDepositInstructions,
    required this.receipt,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      id: json['id'],
      clientReferenceId: json['client_reference_id'],
      state: json['state'],
      onBehalfOf: json['on_behalf_of'],
      currency: json['currency'],
      amount: double.tryParse(json['amount'].toString()) ?? 0.0,
      developerFee: double.tryParse(json['developer_fee'].toString()) ?? 0.0,
      source: Source.fromJson(json['source']),
      destination: Destination.fromJson(json['destination']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      sourceDepositInstructions:
      SourceDepositInstructions.fromJson(json['source_deposit_instructions']),
      receipt: Receipt.fromJson(json['receipt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'client_reference_id': clientReferenceId,
    'state': state,
    'on_behalf_of': onBehalfOf,
    'currency': currency,
    'amount': amount,
    'developer_fee': developerFee,
    'source': source.toJson(),
    'destination': destination.toJson(),
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'source_deposit_instructions': sourceDepositInstructions.toJson(),
    'receipt': receipt.toJson(),
  };
}

class Source {
  final String paymentRail;
  final String currency;
  final String fromAddress;

  Source({
    required this.paymentRail,
    required this.currency,
    required this.fromAddress,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    paymentRail: json['payment_rail'],
    currency: json['currency'],
    fromAddress: json['from_address'],
  );

  Map<String, dynamic> toJson() => {
    'payment_rail': paymentRail,
    'currency': currency,
    'from_address': fromAddress,
  };
}

class Destination {
  final String paymentRail;
  final String currency;
  final String toAddress;

  Destination({
    required this.paymentRail,
    required this.currency,
    required this.toAddress,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
    paymentRail: json['payment_rail'],
    currency: json['currency'],
    toAddress: json['to_address'],
  );

  Map<String, dynamic> toJson() => {
    'payment_rail': paymentRail,
    'currency': currency,
    'to_address': toAddress,
  };
}

class SourceDepositInstructions {
  final String paymentRail;
  final double amount;
  final String currency;
  final String fromAddress;
  final String toAddress;

  SourceDepositInstructions({
    required this.paymentRail,
    required this.amount,
    required this.currency,
    required this.fromAddress,
    required this.toAddress,
  });

  factory SourceDepositInstructions.fromJson(Map<String, dynamic> json) =>
      SourceDepositInstructions(
        paymentRail: json['payment_rail'],
        amount: double.tryParse(json['amount'].toString()) ?? 0.0,
        currency: json['currency'],
        fromAddress: json['from_address'],
        toAddress: json['to_address'],
      );

  Map<String, dynamic> toJson() => {
    'payment_rail': paymentRail,
    'amount': amount,
    'currency': currency,
    'from_address': fromAddress,
    'to_address': toAddress,
  };
}

class Receipt {
  final double initialAmount;
  final double developerFee;
  final double exchangeFee;
  final double subtotalAmount;
  final double gasFee;
  final double finalAmount;

  Receipt({
    required this.initialAmount,
    required this.developerFee,
    required this.exchangeFee,
    required this.subtotalAmount,
    required this.gasFee,
    required this.finalAmount,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
    initialAmount: double.tryParse(json['initial_amount'].toString()) ?? 0.0,
    developerFee: double.tryParse(json['developer_fee'].toString()) ?? 0.0,
    exchangeFee: double.tryParse(json['exchange_fee'].toString()) ?? 0.0,
    subtotalAmount: double.tryParse(json['subtotal_amount'].toString()) ?? 0.0,
    gasFee: double.tryParse(json['gas_fee'].toString()) ?? 0.0,
    finalAmount: double.tryParse(json['final_amount'].toString()) ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    'initial_amount': initialAmount,
    'developer_fee': developerFee,
    'exchange_fee': exchangeFee,
    'subtotal_amount': subtotalAmount,
    'gas_fee': gasFee,
    'final_amount': finalAmount,
  };
}
