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
      institution: json['Institution'],
      branch: json['Branch'],
      clientCategory: json['ClientCategory'],
      clientType: json['ClientType'],
      productCategory: json['ProductCategory'],
      redefinedProductCategory: json['RedefinedProductCategory'],
      contractCategory: json['ContractCategory'],
      mainProductCorrected: json['MainProductCorrected'],
      mainProductIDT: json['MainProductIDT'],
      product: json['Product'],
      contractSubtype: json['ContractSubtype'],
      reportType: json['ReportType'],
      role: json['Role'],
      icon: json['Icon'],
      leaf: json['Leaf'],
      currency: json['Currency'],
      available: (json['Available'] as num?)?.toDouble(),
      balance: (json['Balance'] as num?)?.toDouble(),
      creditLimit: (json['CreditLimit'] as num?)?.toDouble(),
      addLimit: (json['AddLimit'] as num?)?.toDouble(),
      blocked: (json['Blocked'] as num?)?.toDouble(),
      totalDue: (json['TotalDue'] as num?)?.toDouble(),
      pastDue: (json['PastDue'] as num?)?.toDouble(),
      shadowAuthLimit: (json['ShadowAuthLimit'] as num?)?.toDouble(),
      client: json['Client'],
      contractNumber: json['ContractNumber'],
      safeContractNumber: json['SafeContractNumber'],
      contractName: json['ContractName'],
      contractLevel: json['ContractLevel'],
      billingContract: json['BillingContract'],
      topContract: json['TopContract'],
      cbsNumber: json['CBSNumber'],
      openDate: json['OpenDate'],
      checkUsage: json['CheckUsage'],
      lastBillingDate: json['LastBillingDate'],
      nextBillingDate: json['NextBillingDate'],
      pastDueDays: json['PastDueDays'],
      addParmString: json['AddParmString'],
      status: json['Status'],
      statusCode: json['StatusCode'],
      externalCode: json['ExternalCode'],
      lastApplicationDate: json['LastApplicationDate'],
      lastApplicationOfficer: json['LastApplicationOfficer'],
      lastApplicationStatus: json['LastApplicationStatus'],
      lastActivityDate: json['LastActivityDate'],
      ready: json['Ready'],
      amendmentDate: json['AmendmentDate'],
      amendmentOfficer: json['AmendmentOfficer'],
      id: json['ID'],
      clientFullName: json['ClientFullName'],
      productCode: json['ProductCode'],
      mainProductCode: json['MainProductCode'],
      contracts: (json['Contracts'] as List?)?.map((e) => GetContractResponse.fromJson(e)).toList() ?? [],
    );
  }
}