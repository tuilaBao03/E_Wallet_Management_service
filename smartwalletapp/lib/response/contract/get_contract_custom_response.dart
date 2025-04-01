class GetContractResponseCustom {
  final List<GetContractResponseCustom> contracts;
  final String contractNumber;
  final String serviceGroup;
  final String branch;
  final String contractLevel;
  final String parentProduct;
  final String liabContract;
  final String contractName;
  final String product;
  final String billingContract;

  GetContractResponseCustom({
    required this.contracts,
    required this.contractNumber,
    required this.serviceGroup,
    required this.branch,
    required this.contractLevel,
    required this.parentProduct,
    required this.liabContract,
    required this.contractName,
    required this.product,
    required this.billingContract,
  });

  /// Chuyển từ JSON sang Object
  factory GetContractResponseCustom.fromJson(Map<String, dynamic> json) {
    return GetContractResponseCustom(
      contracts: (json['contract'] as List<dynamic>?)
              ?.map((e) => GetContractResponseCustom.fromJson(e))
              .toList() ??
          [],
      contractNumber: json['contractNumber'] ?? '',
      serviceGroup: json['SERVICE_GROUP'] ?? '',
      branch: json['branch'] ?? '',
      contractLevel: json['contractLevel'] ?? '',
      parentProduct: json['parentProduct']?? '',
      liabContract: json['liabContract']?? '',
      contractName: json['contractName'] ?? '',
      product: json['productCode']?? '',
      billingContract: json['billingContract'] ?? '',
    );
  }

  /// Chuyển từ Object sang JSON
  Map<String, dynamic> toJson() {
    return {
      'contracts': contracts.map((e) => e.toJson()).toList(),
      'contract_NUMBER': contractNumber,
      'service_GROUP': serviceGroup,
      'branch': branch,
      'contract_LEVEL': contractLevel,
      'parent_PRODUCT': parentProduct,
      'liab_CONTRACT': liabContract,
      'contract_NAME': contractName,
      'product': product,
      'billing_CONTRACT': billingContract,
    };
  }
}