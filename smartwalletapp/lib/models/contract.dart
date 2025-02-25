class Contract {
  final String contractID;
  final bool status;
  final DateTime createdDate;
  final DateTime updatedDate;
  final String userID;
  final String note;
  final String url;
  final String cardHolderID;
  final String parent; // ID của hợp đồng cha
  final String type;
  final List<Contract> children; // Danh sách hợp đồng con

  Contract({
    required this.contractID,
    required this.userID,
    required this.createdDate,
    required this.updatedDate,
    required this.status,
    required this.note,
    required this.url,
    required this.cardHolderID,
    required this.parent,
    required this.type,
    List<Contract>? children, // Mặc định là danh sách rỗng
  }) : children = children ?? []; // Mặc định là danh sách rỗng

  // Chuyển đổi từ JSON
  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      contractID: json['contractID'],
      userID: json['userID'],
      createdDate: DateTime.parse(json['createdDate']),
      updatedDate: DateTime.parse(json['updatedDate']),
      status: json['status'],
      note: json['note'],
      url: json['url'],
      cardHolderID: json['cardHolderID'],
      parent: json['parent'],
      type: json['type'],
      children: (json['children'] as List<dynamic>?)
              ?.map((item) => Contract.fromJson(item))
              .toList() ??
          [],
    );
  }

  // Chuyển đổi thành JSON
  Map<String, dynamic> toJson() {
    return {
      'contractID': contractID,
      'userID': userID,
      'createdDate': createdDate.toIso8601String(),
      'updatedDate': updatedDate.toIso8601String(),
      'status': status,
      'note': note,
      'url': url,
      'cardHolderID': cardHolderID,
      'parent': parent,
      'type': type,
      'children': children.map((child) => child.toJson()).toList(),
    };
  }
}

// Danh sách hợp đồng mẫu
List<Contract> contractList = [
  Contract(
    contractID: "1",
    userID: "1",
    createdDate: DateTime.now(),
    updatedDate: DateTime.now(),
    status: true,
    note: "Hợp đồng mở thẻ ngân hàng",
    url: "https://example.com/contracts/C12345",
    cardHolderID: '1',
    parent: 'null',
    type: 'A',
    children: [
      Contract(
          contractID: "2",
          userID: "1",
          createdDate: DateTime.now(),
          updatedDate: DateTime.now(),
          status: true,
          note: "Hợp đồng phụ - mở thẻ tín dụng",
          url: "https://example.com/contracts/C12346",
          cardHolderID: '1',
          parent: '1', // Liên kết với hợp đồng cha "1"
          type: 'C',
      ),
      Contract(
          contractID: "3",
          userID: "1",
          createdDate: DateTime.now(),
          updatedDate: DateTime.now(),
          status: true,
          note: "Hợp đồng phụ - đăng ký bảo hiểm",
          url: "https://example.com/contracts/C12347",
          cardHolderID: '1',
          parent: '1', // Liên kết với hợp đồng cha "1"
          type: 'C',
      ),
    ]
  ),
  
];
