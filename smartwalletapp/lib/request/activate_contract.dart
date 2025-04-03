class ActivateCard {
  String contractSearchMethod;
  String contractIdentifier;
  String reason;

  ActivateCard({
    required this.contractSearchMethod,
    required this.contractIdentifier,
    required this.reason,
  });

  // Chuyển đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'contractSearchMethod': contractSearchMethod,
      'contractIdentifier': contractIdentifier,
      'reason': reason,
    };
  }

  // Tạo đối tượng từ JSON
  factory ActivateCard.fromJson(Map<String, dynamic> json) {
    return ActivateCard(
      contractSearchMethod: json['contractSearchMethod'],
      contractIdentifier: json['contractIdentifier'],
      reason: json['reason'],
    );
  }

  @override
  String toString() {
    return 'ActivateCard(contractSearchMethod: $contractSearchMethod, '
        'contractIdentifier: $contractIdentifier, reason: $reason)';
  }
}

