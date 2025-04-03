class SetStatus {
  String contractSearchMethod;
  String contractIdentifier;
  String newStatus;
  String reason;

  SetStatus({
    required this.contractSearchMethod,
    required this.contractIdentifier,
    required this.newStatus,
    required this.reason,
  });

  // Chuyển đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'contractSearchMethod': contractSearchMethod,
      'contractIdentifier': contractIdentifier,
      'newStatus': newStatus,
      'reason': reason,
    };
  }
}