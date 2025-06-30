class KycResponse {
  final String id;
  final String fullName;
  final String email;
  final String type;
  final String kycLink;
  final String tosLink;
  final String kycStatus;
  final String tosStatus;
  final DateTime createdAt;
  final String customerId;
  final String personaInquiryType;
  final List<dynamic> rejectionReasons;

  KycResponse({
    required this.id,
    required this.fullName,
    required this.email,
    required this.type,
    required this.kycLink,
    required this.tosLink,
    required this.kycStatus,
    required this.tosStatus,
    required this.createdAt,
    required this.customerId,
    required this.personaInquiryType,
    required this.rejectionReasons,
  });

  factory KycResponse.fromJson(Map<String, dynamic> json) {
    return KycResponse(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      type: json['type'],
      kycLink: json['kyc_link'],
      tosLink: json['tos_link'],
      kycStatus: json['kyc_status'],
      tosStatus: json['tos_status'],
      createdAt: DateTime.parse(json['created_at']),
      customerId: json['customer_id'],
      personaInquiryType: json['persona_inquiry_type'],
      rejectionReasons: json['rejection_reasons'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'type': type,
      'kyc_link': kycLink,
      'tos_link': tosLink,
      'kyc_status': kycStatus,
      'tos_status': tosStatus,
      'created_at': createdAt.toIso8601String(),
      'customer_id': customerId,
      'persona_inquiry_type': personaInquiryType,
      'rejection_reasons': rejectionReasons,
    };
  }
}
