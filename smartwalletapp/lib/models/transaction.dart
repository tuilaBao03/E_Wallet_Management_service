class Transaction {
  final String icon, bankName, budget,typeMoney ;
  final bool typeTransaction;
  final DateTime date;
  final String transactionId ;
  final String cardId;
  Transaction({required this.cardId ,required this.transactionId, required this.icon, required this.bankName, required this.date, required this.budget,required this.typeTransaction, required this.typeMoney, });
}

List<Transaction> demoTransactionList = [
  Transaction(
    icon: "assets/logos/zybank-rect.svg",
    bankName: "zybank",
    date: DateTime.now(),
    budget: "100000",
    typeMoney:"VNĐ",
    typeTransaction: true, 
    transactionId: '1', cardId: '1'
  ),
  Transaction(
    icon: "assets/logos/zybank-rect.svg",
    bankName: "zybank",
    date: DateTime.now(),
    budget: "100000",
    typeMoney:"VNĐ",
    typeTransaction: true, transactionId: '2', cardId: '1'
  ),
  Transaction(
    
    icon: "assets/logos/zybank-rect.svg",
    bankName: "zybank",
    date: DateTime.now(),
    budget: "100000",
    typeMoney:"VNĐ",
    typeTransaction: true, transactionId: '3', cardId: '1'
  ),
  Transaction(
    
    icon: "assets/logos/zybank-rect.svg",
    bankName: "zybank",
    date: DateTime.now(),
    budget: "100000",
    typeMoney:"VNĐ",
    typeTransaction: true, transactionId: '4', cardId: '1'
  ),
];
