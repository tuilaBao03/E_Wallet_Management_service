class CreateCardRequest {
  String contractSearchMethod;
  String contractIdentifier;
  String productCode;
  String productCode2;
  String productCode3;
  String cardName;
  String cbsNumber;
  String embossedFirstName;
  String embossedLastName;
  String embossedCompanyName;

  CreateCardRequest({
    required this.contractSearchMethod,
    required this.contractIdentifier,
    required this.productCode,
    required this.productCode2,
    required this.productCode3,
    required this.cardName,
    required this.cbsNumber,
    required this.embossedFirstName,
    required this.embossedLastName,
    required this.embossedCompanyName,
  });

  /// Parse từ JSON
  factory CreateCardRequest.fromJson(Map<String, dynamic> json) {
    return CreateCardRequest(
      contractSearchMethod: json['ContractSearchMethod'],
      contractIdentifier: json['ContractIdentifier'],
      productCode: json['ProductCode'],
      productCode2: json['ProductCode2'],
      productCode3: json['ProductCode3'],
      cardName: json['CardName'],
      cbsNumber: json['CBSNumber'],
      embossedFirstName: json['EmbossedFirstName'],
      embossedLastName: json['EmbossedLastName'],
      embossedCompanyName: json['EmbossedCompanyName'],
    );
  }

  /// Chuyển về JSON
  Map<String, dynamic> toJson() {
    return {
      'ContractSearchMethod': contractSearchMethod,
      'ContractIdentifier': contractIdentifier,
      'ProductCode': productCode,
      'ProductCode2': productCode2,
      'ProductCode3': productCode3,
      'CardName': cardName,
      'CBSNumber': cbsNumber,
      'EmbossedFirstName': embossedFirstName,
      'EmbossedLastName': embossedLastName,
      'EmbossedCompanyName': embossedCompanyName,
    };
  }

  /// Lấy danh sách field để tự động tạo field nhập liệu
  static List<String> getFieldNames() {
    return [
      'contractSearchMethod',
      'contractIdentifier',
      'productCode',
      'productCode2',
      'productCode3',
      'cardName',
      'cbsNumber',
      'embossedFirstName',
      'embossedLastName',
      'embossedCompanyName',
    ];
  }

  /// Hàm gán giá trị cho field
  void setValueByField(String field, String value) {
    switch (field) {
      case 'contractSearchMethod':
        contractSearchMethod = value;
        break;
      case 'contractIdentifier':
        contractIdentifier = value;
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
      case 'cardName':
        cardName = value;
        break;
      case 'cbsNumber':
        cbsNumber = value;
        break;
      case 'embossedFirstName':
        embossedFirstName = value;
        break;
      case 'embossedLastName':
        embossedLastName = value;
        break;
      case 'embossedCompanyName':
        embossedCompanyName = value;
        break;
    }
  }

  /// Lấy giá trị theo field
  String getValueByField(String field) {
    switch (field) {
      case 'contractSearchMethod':
        return contractSearchMethod;
      case 'contractIdentifier':
        return contractIdentifier;
      case 'productCode':
        return productCode;
      case 'productCode2':
        return productCode2;
      case 'productCode3':
        return productCode3;
      case 'cardName':
        return cardName;
      case 'cbsNumber':
        return cbsNumber;
      case 'embossedFirstName':
        return embossedFirstName;
      case 'embossedLastName':
        return embossedLastName;
      case 'embossedCompanyName':
        return embossedCompanyName;
      default:
        return '';
    }
  }
}
List<CreateCardRequest> cardsList = [
  CreateCardRequest(
    contractSearchMethod: "ByNumber",
    contractIdentifier: "CT001",
    productCode: "SP001",
    productCode2: "SP002",
    productCode3: "SP003",
    cardName: "Thẻ tín dụng vàng",
    cbsNumber: "CBS001",
    embossedFirstName: "Nguyen",
    embossedLastName: "Van A",
    embossedCompanyName: "Công ty ABC",
  ),
  CreateCardRequest(
    contractSearchMethod: "ByID",
    contractIdentifier: "CT002",
    productCode: "SP004",
    productCode2: "SP005",
    productCode3: "SP006",
    cardName: "Thẻ ghi nợ chuẩn",
    cbsNumber: "CBS002",
    embossedFirstName: "Tran",
    embossedLastName: "Thi B",
    embossedCompanyName: "Công ty XYZ",
  ),
  CreateCardRequest(
    contractSearchMethod: "ByName",
    contractIdentifier: "CT003",
    productCode: "SP007",
    productCode2: "SP008",
    productCode3: "SP009",
    cardName: "Thẻ hội viên VIP",
    cbsNumber: "CBS003",
    embossedFirstName: "Le",
    embossedLastName: "Van C",
    embossedCompanyName: "Công ty MNO",
  ),
];

