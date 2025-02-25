// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';

import '../constants.dart';

class CardInfo {
  final String svgSrc, bankName;
  final double balance;
  final Color color;
  final String CardID;
  final String userId;
  final String cardHolderId;
  final String typeCard;
  final DateTime createdDate;
  final DateTime updateDate;
  final bool status;
  final String contractID;
  final double limit;

  CardInfo({
    required this.cardHolderId,
    required this.CardID,
    required this.userId,
    required this.svgSrc,
    required this.bankName,
    required this.balance,
    required this.color,
    required this.typeCard,
    required this.createdDate,
    required this.updateDate,
    required this.status,
    required this.contractID,
    required this.limit
  });
  /// 🔹 **Chuyển đối tượng `CardInfo` thành JSON**
  Map<String, dynamic> toJson() {
    return {
      'cardHolderId': cardHolderId,
      'CardID': CardID,
      'userId': userId,
      'svgSrc': svgSrc,
      'bankName': bankName,
      'balance': balance,
      'color': color.value, // Chuyển màu thành số nguyên để lưu trữ
      'typeCard': typeCard,
      'createdDate': createdDate.toIso8601String(),
      'updateDate': updateDate.toIso8601String(),
      'status': status,
      'contractID': contractID,
      'limit': limit,
    };
  }

  /// 🔹 **Chuyển JSON thành đối tượng `CardInfo`**
  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
      cardHolderId: json['cardHolderId'],
      CardID: json['CardID'],
      userId: json['userId'],
      svgSrc: json['svgSrc'],
      bankName: json['bankName'],
      balance: json['balance'].toDouble(),
      color: Color(json['color']), // Chuyển số nguyên thành màu
      typeCard: json['typeCard'],
      createdDate: DateTime.parse(json['createdDate']),
      updateDate: DateTime.parse(json['updateDate']),
      status: json['status'],
      contractID: json['contractID'],
      limit: json['limit'].toDouble(),
    );
  }
}



List<CardInfo> MyCards = [
  CardInfo(
    bankName: "ChineBank",
    balance: 1328,
    svgSrc: "assets/logos/xynsh-rect.svg",
    color: primaryColor,
    CardID: '1',
    userId: '1',
    typeCard: "DebitCard",
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true,
    contractID: "2", cardHolderId: '1', limit: 0,
  ),
  CardInfo(
    bankName: "ABChinaBank",
    balance: 1328,
    svgSrc: "assets/logos/zybank-rect.svg",
    color: primaryColor,
    CardID: '2',
    userId: '1',
    typeCard: "DebitCard",
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true,
    contractID: "2",
    cardHolderId: '1', limit: 0,
  ),
  CardInfo(
    bankName: "ABChinaBank",
    balance: 1328,
    svgSrc: "assets/logos/zybank-rect.svg",
    color: primaryColor,
    CardID: '2',
    userId: '1',
    typeCard: "DebitCard",
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true,
    contractID: "2",
    cardHolderId: '1', limit: 0,
  ),
  CardInfo(
    bankName: "ABChinaBank",
    balance: 1328,
    svgSrc: "assets/logos/zybank-rect.svg",
    color: primaryColor,
    CardID: '2',
    userId: '1',
    typeCard: "DebitCard",
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true,
    contractID: "2",
    cardHolderId: '1', limit: 0,
  ),
];
