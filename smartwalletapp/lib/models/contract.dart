class Contract {
  String reason; // map to <wsin:Reason>
  String clientIdentifier; // map to <wsin:ClientIdentifier>
  String clientSearchMethod; // map to <wsin:ClientSearchMethod>
  String branch; // map to <wsin:Branch>
  String institutionCode; // map to <wsin:InstitutionCode>
  String productCode; // map to <wsin:ProductCode>
  String productCode2; // map to <wsin:ProductCode2>
  String productCode3; // map to <wsin:ProductCode3>
  String contractName; // map to <wsin:ContractName>
  String cbsNumber; // map to <wsin:CBSNumber>
  String customData; // map to <wsin:CustomData>

  Contract({
    required
    this.reason,
     required this.clientIdentifier,
     required this.clientSearchMethod,
     required this.branch,
     required this.institutionCode,
     required this.productCode,
     required this.productCode2,
     required this.productCode3,
     required this.contractName,
     required this.cbsNumber,
     required this.customData,
  });

  /// Parse từ JSON
  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      reason: json['Reason'],
      clientIdentifier: json['ClientIdentifier'],
      clientSearchMethod: json['ClientSearchMethod'],
      branch: json['Branch'],
      institutionCode: json['InstitutionCode'],
      productCode: json['ProductCode'],
      productCode2: json['ProductCode2'],
      productCode3: json['ProductCode3'],
      contractName: json['ContractName'],
      cbsNumber: json['CBSNumber'],
      customData: json['CustomData'],
    );
  }

  /// Chuyển về JSON
  Map<String, dynamic> toJson() {
    return {
      'Reason': reason,
      'ClientIdentifier': clientIdentifier,
      'ClientSearchMethod': clientSearchMethod,
      'Branch': branch,
      'InstitutionCode': institutionCode,
      'ProductCode': productCode,
      'ProductCode2': productCode2,
      'ProductCode3': productCode3,
      'ContractName': contractName,
      'CBSNumber': cbsNumber,
      'CustomData': customData,
    };
  }
  // Các trường contract như bạn đã khai báo

  // Lấy danh sách field để tự động tạo field nhập liệu
  static List<String> getFieldNames() {
    return [
      'reason',
      'clientIdentifier',
      'clientSearchMethod',
      'branch',
      'institutionCode',
      'productCode',
      'productCode2',
      'productCode3',
      'contractName',
      'cbsNumber',
      'customData',
    ];
  }

  // Hàm gán giá trị cho field
  void setValueByField(String field, String value) {
    switch (field) {
      case 'reason':
        reason = value;
        break;
      case 'clientIdentifier':
        clientIdentifier = value;
        break;
      case 'clientSearchMethod':
        clientSearchMethod = value;
        break;
      case 'branch':
        branch = value;
        break;
      case 'institutionCode':
        institutionCode = value;
        break;
      case 'productCode':
        productCode = value;
        break;
      case 'productCode2':
        productCode2 = value;
        break;
      case 'productCode3':
        productCode3 = value;
        break;
      case 'contractName':
        contractName = value;
        break;
      case 'cbsNumber':
        cbsNumber = value;
        break;
      case 'customData':
        customData = value;
        break;
    }
  }

  String getValueByField(String field) {
    switch (field) {
      case 'reason':
        return reason;
      case 'clientIdentifier':
        return clientIdentifier;
      case 'clientSearchMethod':
        return clientSearchMethod;
      case 'branch':
        return branch;
      case 'institutionCode':
        return institutionCode;
      case 'productCode':
        return productCode;
      case 'productCode2':
        return productCode2;
      case 'productCode3':
        return productCode3;
      case 'contractName':
        return contractName;
      case 'cbsNumber':
        return cbsNumber;
      case 'customData':
        return customData;
      default:
        return '';
    }
  }
}



// Khởi tạo danh sách hợp đồng mẫu
List<Contract> contractList = [
  Contract(
    reason: "Mở tài khoản mới",
    clientIdentifier: "KH001",
    clientSearchMethod: "ByName",
    branch: "CN001",
    institutionCode: "INST001",
    productCode: "SP001",
    productCode2: "SP002",
    productCode3: "SP003",
    contractName: "Hợp đồng số 1",
    cbsNumber: "CBS001",
    customData: "Thông tin thêm 1",
  ),
  Contract(
    reason: "Gia hạn thẻ",
    clientIdentifier: "KH002",
    clientSearchMethod: "ByID",
    branch: "CN002",
    institutionCode: "INST002",
    productCode: "SP004",
    productCode2: "SP005",
    productCode3: "SP006",
    contractName: "Hợp đồng số 2",
    cbsNumber: "CBS002",
    customData: "Thông tin thêm 2",
  ),
  Contract(
    reason: "Đăng ký dịch vụ mới",
    clientIdentifier: "KH003",
    clientSearchMethod: "ByEmail",
    branch: "CN003",
    institutionCode: "INST003",
    productCode: "SP007",
    productCode2: "SP008",
    productCode3: "SP009",
    contractName: "Hợp đồng số 3",
    cbsNumber: "CBS003",
    customData: "Thông tin thêm 3",
  ),
];

