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
