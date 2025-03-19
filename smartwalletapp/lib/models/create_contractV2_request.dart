class CreateContractV2Request {
  String branch;
  String institutionCode;
  String contractName;
  String cbsNumber;
  String addInfo01;
  String addInfo02;
  String liabCategory;
  String liabContractSearchMethod;
  String liabContractIdentifier;
  String clientSearchMethod;
  String clientIdentifier;
  String productCode;
  String productCode2;
  String productCode3;

  CreateContractV2Request({
    required this.branch,
    required this.institutionCode,
    required this.contractName,
    required this.cbsNumber,
    required this.addInfo01,
    required this.addInfo02,
    required this.liabCategory,
    required this.liabContractSearchMethod,
    required this.liabContractIdentifier,
    required this.clientSearchMethod,
    required this.clientIdentifier,
    required this.productCode,
    required this.productCode2,
    required this.productCode3,
  });

  /// Parse từ JSON
  factory CreateContractV2Request.fromJson(Map<String, dynamic> json) {
    return CreateContractV2Request(
      branch: json['Branch'],
      institutionCode: json['InstitutionCode'],
      contractName: json['ContractName'],
      cbsNumber: json['CBSNumber'],
      addInfo01: json['AddInfo01'],
      addInfo02: json['AddInfo02'],
      liabCategory: json['LiabCategory'],
      liabContractSearchMethod: json['LiabContractSearchMethod'],
      liabContractIdentifier: json['LiabContractIdentifier'],
      clientSearchMethod: json['ClientSearchMethod'],
      clientIdentifier: json['ClientIdentifier'],
      productCode: json['ProductCode'],
      productCode2: json['ProductCode2'],
      productCode3: json['ProductCode3'],
    );
  }

  /// Chuyển về JSON
  Map<String, dynamic> toJson() {
    return {
      'Branch': branch,
      'InstitutionCode': institutionCode,
      'ContractName': contractName,
      'CBSNumber': cbsNumber,
      'AddInfo01': addInfo01,
      'AddInfo02': addInfo02,
      'LiabCategory': liabCategory,
      'LiabContractSearchMethod': liabContractSearchMethod,
      'LiabContractIdentifier': liabContractIdentifier,
      'ClientSearchMethod': clientSearchMethod,
      'ClientIdentifier': clientIdentifier,
      'ProductCode': productCode,
      'ProductCode2': productCode2,
      'ProductCode3': productCode3,
    };
  }

  /// Lấy danh sách field để tự động tạo field nhập liệu
  static List<String> getFieldNames() {
    return [
      'branch',
      'institutionCode',
      'contractName',
      'cbsNumber',
      'addInfo01',
      'addInfo02',
      'liabCategory',
      'liabContractSearchMethod',
      'liabContractIdentifier',
      'clientSearchMethod',
      'clientIdentifier',
      'productCode',
      'productCode2',
      'productCode3',
    ];
  }

  /// Hàm gán giá trị cho field
  void setValueByField(String field, String value) {
    switch (field) {
      case 'branch':
        branch = value;
        break;
      case 'institutionCode':
        institutionCode = value;
        break;
      case 'contractName':
        contractName = value;
        break;
      case 'cbsNumber':
        cbsNumber = value;
        break;
      case 'addInfo01':
        addInfo01 = value;
        break;
      case 'addInfo02':
        addInfo02 = value;
        break;
      case 'liabCategory':
        liabCategory = value;
        break;
      case 'liabContractSearchMethod':
        liabContractSearchMethod = value;
        break;
      case 'liabContractIdentifier':
        liabContractIdentifier = value;
        break;
      case 'clientSearchMethod':
        clientSearchMethod = value;
        break;
      case 'clientIdentifier':
        clientIdentifier = value;
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
    }
  }

  /// Lấy giá trị theo field
  String getValueByField(String field) {
    switch (field) {
      case 'branch':
        return branch;
      case 'institutionCode':
        return institutionCode;
      case 'contractName':
        return contractName;
      case 'cbsNumber':
        return cbsNumber;
      case 'addInfo01':
        return addInfo01;
      case 'addInfo02':
        return addInfo02;
      case 'liabCategory':
        return liabCategory;
      case 'liabContractSearchMethod':
        return liabContractSearchMethod;
      case 'liabContractIdentifier':
        return liabContractIdentifier;
      case 'clientSearchMethod':
        return clientSearchMethod;
      case 'clientIdentifier':
        return clientIdentifier;
      case 'productCode':
        return productCode;
      case 'productCode2':
        return productCode2;
      case 'productCode3':
        return productCode3;
      default:
        return '';
    }
  }
}

List<CreateContractV2Request> contractV2List = [
  CreateContractV2Request(
    branch: "CN001",
    institutionCode: "INST001",
    contractName: "Hợp đồng bảo hiểm A",
    cbsNumber: "CBS001",
    addInfo01: "Thông tin thêm 1",
    addInfo02: "Ghi chú 1",
    liabCategory: "LC001",
    liabContractSearchMethod: "ByNumber",
    liabContractIdentifier: "LCID001",
    clientSearchMethod: "ByID",
    clientIdentifier: "KH001",
    productCode: "SP001",
    productCode2: "SP002",
    productCode3: "SP003",
  ),
  CreateContractV2Request(
    branch: "CN002",
    institutionCode: "INST002",
    contractName: "Hợp đồng vay B",
    cbsNumber: "CBS002",
    addInfo01: "Thông tin thêm 2",
    addInfo02: "Ghi chú 2",
    liabCategory: "LC002",
    liabContractSearchMethod: "ByName",
    liabContractIdentifier: "LCID002",
    clientSearchMethod: "ByEmail",
    clientIdentifier: "KH002",
    productCode: "SP004",
    productCode2: "SP005",
    productCode3: "SP006",
  ),
  CreateContractV2Request(
    branch: "CN003",
    institutionCode: "INST003",
    contractName: "Hợp đồng dịch vụ C",
    cbsNumber: "CBS003",
    addInfo01: "Thông tin thêm 3",
    addInfo02: "Ghi chú 3",
    liabCategory: "LC003",
    liabContractSearchMethod: "ByPhone",
    liabContractIdentifier: "LCID003",
    clientSearchMethod: "ByPhone",
    clientIdentifier: "KH003",
    productCode: "SP007",
    productCode2: "SP008",
    productCode3: "SP009",
  ),
];

