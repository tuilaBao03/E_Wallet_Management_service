class GetContractResponse {
  String? institution;
  String? branch;
  String? clientCategory;
  String? clientType;
  String? productCategory;
  String? redefinedProductCategory;
  String? contractCategory;
  String? mainProductCorrected;
  String? mainProductIDT;
  String? product;
  String? contractSubtype;
  String? reportType;
  String? role;
  String? icon;
  String? leaf;
  String? currency;
  double? available;
  double? balance;
  double? creditLimit;
  double? addLimit;
  double? blocked;
  double? totalDue;
  double? pastDue;
  double? shadowAuthLimit;
  String? client;
  String? contractNumber;
  String? safeContractNumber;
  String? contractName;
  String? contractLevel;
  String? billingContract;
  String? topContract;
  String? cbsNumber;
  String? openDate;
  String? checkUsage;
  String? lastBillingDate;
  String? nextBillingDate;
  int? pastDueDays;
  String? addParmString;
  String? status;
  String? statusCode;
  String? externalCode;
  String? lastApplicationDate;
  String? lastApplicationOfficer;
  String? lastApplicationStatus;
  String? lastActivityDate;
  String? ready;
  String? amendmentDate;
  String? amendmentOfficer;
  String? id;
  String? clientFullName;
  String? productCode;
  String? mainProductCode;
  List<GetContractResponse> contracts;

  // Constructor
  GetContractResponse({
    this.institution,
    this.branch,
    this.clientCategory,
    this.clientType,
    this.productCategory,
    this.redefinedProductCategory,
    this.contractCategory,
    this.mainProductCorrected,
    this.mainProductIDT,
    this.product,
    this.contractSubtype,
    this.reportType,
    this.role,
    this.icon,
    this.leaf,
    this.currency,
    this.available,
    this.balance,
    this.creditLimit,
    this.addLimit,
    this.blocked,
    this.totalDue,
    this.pastDue,
    this.shadowAuthLimit,
    this.client,
    this.contractNumber,
    this.safeContractNumber,
    this.contractName,
    this.contractLevel,
    this.billingContract,
    this.topContract,
    this.cbsNumber,
    this.openDate,
    this.checkUsage,
    this.lastBillingDate,
    this.nextBillingDate,
    this.pastDueDays,
    this.addParmString,
    this.status,
    this.statusCode,
    this.externalCode,
    this.lastApplicationDate,
    this.lastApplicationOfficer,
    this.lastApplicationStatus,
    this.lastActivityDate,
    this.ready,
    this.amendmentDate,
    this.amendmentOfficer,
    this.id,
    this.clientFullName,
    this.productCode,
    this.mainProductCode,
    this.contracts = const [],
  });

  // Tạo đối tượng từ JSON
factory GetContractResponse.fromJson(Map<String, dynamic> json) {
  return GetContractResponse(
    institution: json['institution'] ?? '',
    branch: json['branch'] ?? '',
    clientCategory: json['clientCategory'] ?? '',
    clientType: json['clientType'] ?? '',
    productCategory: json['productCategory'] ?? '',
    redefinedProductCategory: json['redefinedProductCategory'] ?? '',
    contractCategory: json['contractCategory'] ?? '',
    mainProductCorrected: json['mainProductCorrected'] ?? '',
    mainProductIDT: json['mainProductIDT'] ?? '',
    product: json['product'] ?? '',
    contractSubtype: json['contractSubtype'] ?? '',
    reportType: json['reportType'] ?? '',
    role: json['role'] ?? '',
    icon: json['icon'] ?? '',
    leaf: json['leaf'] ?? '',
    currency: json['currency'] ?? 'USD',
    available: (json['available'] as num?)?.toDouble() ?? 0.0,
    balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
    creditLimit: (json['creditLimit'] as num?)?.toDouble() ?? 0.0,
    addLimit: (json['addLimit'] as num?)?.toDouble() ?? 0.0,
    blocked: (json['blocked'] as num?)?.toDouble() ?? 0.0,
    totalDue: (json['totalDue'] as num?)?.toDouble() ?? 0.0,
    pastDue: (json['pastDue'] as num?)?.toDouble() ?? 0.0,
    shadowAuthLimit: (json['shadowAuthLimit'] as num?)?.toDouble() ?? 0.0,
    client: json['client'] ?? '',
    contractNumber: json['contractNumber'] ?? '',
    safeContractNumber: json['safeContractNumber'] ?? '',
    contractName: json['contractName'] ?? 'Unknown Contract',
    contractLevel: json['contractLevel'] ?? '',
    billingContract: json['billingContract'] ?? '',
    topContract: json['topContract'] ?? '',
    cbsNumber: json['CBSNumber'] ?? '',
    openDate: json['openDate'] ?? '1970-01-01',
    checkUsage: json['checkUsage'] ?? '',
    lastBillingDate: json['lastBillingDate'] ?? '',
    nextBillingDate: json['nextBillingDate'] ?? '',
    pastDueDays: json['pastDueDays'] ?? 0,
    addParmString: json['addParmString'] ?? '',
    status: json['status'] ?? 'Active',
    statusCode: json['statusCode'] ?? 'N/A',
    externalCode: json['externalCode'] ?? '',
    lastApplicationDate: json['lastApplicationDate'] ?? '',
    lastApplicationOfficer: json['lastApplicationOfficer'] ?? '',
    lastApplicationStatus: json['lastApplicationStatus'] ?? '',
    lastActivityDate: json['lastActivityDate'] ?? '',
    ready: json['ready'] ?? 'Yes',
    amendmentDate: json['amendmentDate'] ?? '',
    amendmentOfficer: json['amendmentOfficer'] ?? '',
    id: json['id'] ?? '',
    clientFullName: json['clientFullName'] ?? 'Unknown Client',
    productCode: json['productCode'] ?? '',
    mainProductCode: json['mainProductCode'] ?? '',
    contracts: (json['contracts'] as List?)
            ?.map((e) => GetContractResponse.fromJson(e))
            .toList() ??
        [],
  );
}
@override
String toString() {
  return '''
  GetContractResponse {
    institution: $institution,
    branch: $branch,
    clientCategory: $clientCategory,
    clientType: $clientType,
    productCategory: $productCategory,
    redefinedProductCategory: $redefinedProductCategory,
    contractCategory: $contractCategory,
    mainProductCorrected: $mainProductCorrected,
    mainProductIDT: $mainProductIDT,
    product: $product,
    contractSubtype: $contractSubtype,
    reportType: $reportType,
    role: $role,
    icon: $icon,
    leaf: $leaf,
    currency: $currency,
    available: $available,
    balance: $balance,
    creditLimit: $creditLimit,
    addLimit: $addLimit,
    blocked: $blocked,
    totalDue: $totalDue,
    pastDue: $pastDue,
    shadowAuthLimit: $shadowAuthLimit,
    client: $client,
    contractNumber: $contractNumber,
    safeContractNumber: $safeContractNumber,
    contractName: $contractName,
    contractLevel: $contractLevel,
    billingContract: $billingContract,
    topContract: $topContract,
    cbsNumber: $cbsNumber,
    openDate: $openDate,
    checkUsage: $checkUsage,
    lastBillingDate: $lastBillingDate,
    nextBillingDate: $nextBillingDate,
    pastDueDays: $pastDueDays,
    addParmString: $addParmString,
    status: $status,
    statusCode: $statusCode,
    externalCode: $externalCode,
    lastApplicationDate: $lastApplicationDate,
    lastApplicationOfficer: $lastApplicationOfficer,
    lastApplicationStatus: $lastApplicationStatus,
    lastActivityDate: $lastActivityDate,
    ready: $ready,
    amendmentDate: $amendmentDate,
    amendmentOfficer: $amendmentOfficer,
    id: $id,
    clientFullName: $clientFullName,
    productCode: $productCode,
    mainProductCode: $mainProductCode,
    contracts: ${contracts.length} sub-contracts
  }''';
}


}