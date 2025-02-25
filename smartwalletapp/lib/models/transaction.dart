class Transaction {
  final String icon, bankName, budget,typeMoney ;
  final int typeTransaction;
  final DateTime date;
  final String transactionId ;
  final String contractID;
  final String note;
  Transaction( {
    required this.contractID ,
    required this.transactionId, 
    required this.icon, 
    required this.bankName, 
    required this.date, 
    required this.budget,
    required this.typeTransaction, 
    required this.typeMoney,
    required this.note,
     });
  /// 🔹 **Chuyển đối tượng `Transaction` thành JSON**
  Map<String, dynamic> toJson() {
    return {
      'contractID': contractID,
      'transactionId': transactionId,
      'icon': icon,
      'bankName': bankName,
      'date': date.toIso8601String(),
      'budget': budget,
      'typeTransaction': typeTransaction,
      'typeMoney': typeMoney,
      'note': note,
    };
  }

  /// 🔹 **Chuyển JSON thành đối tượng `Transaction`**
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      contractID: json['contractID'],
      transactionId: json['transactionId'],
      icon: json['icon'],
      bankName: json['bankName'],
      date: DateTime.parse(json['date']),
      budget: json['budget'],
      typeTransaction: json['typeTransaction'],
      typeMoney: json['typeMoney'],
      note: json['note'],
    );
  }

}

List<Transaction> demoTransactionList = [
  Transaction(
    icon: "assets/logos/zybank-rect.svg",
    bankName: "zybank",
    date: DateTime.now(),
    budget: "100000",
    typeMoney:"VNĐ",
    typeTransaction: 0,//nạp tiền 
    transactionId: '1', contractID: '2', note: ''
  ),
  Transaction(
    icon: "assets/logos/zybank-rect.svg",
    bankName: "zybank",
    date: DateTime.now(),
    budget: "100000",
    typeMoney:"VNĐ",
    typeTransaction: 1,//rút tiền
     transactionId: '2', contractID: '2',
      note: ''
  ),
  Transaction(
    
    icon: "assets/logos/zybank-rect.svg",
    bankName: "zybank",
    date: DateTime.now(),
    budget: "100000",
    typeMoney:"VNĐ",
    typeTransaction: 1,
    transactionId: '3', contractID: '2',
      note: ''
  ),
];
