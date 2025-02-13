// ignore_for_file: non_constant_identifier_names

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
    bankName: "BangKokBank",
    balance: 1328,
    svgSrc: "assets/logos/zxbk-rect.svg",
    color: primaryColor,
    CardID: '3',
    userId: '1',
    typeCard: "DebitCard",
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: false,
    contractID: "2",
    cardHolderId: '1', limit: 0,
  ),
];
