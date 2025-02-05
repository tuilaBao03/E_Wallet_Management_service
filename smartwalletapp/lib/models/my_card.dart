
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../constants.dart';

class CardInfo {
  final String? svgSrc, title;
  final int? balance, percentage;
  final Color? color;

  CardInfo({
    this.svgSrc,
    this.title,

    this.balance,
    this.percentage,
    this.color,
  });
}

List MyCards = [
  CardInfo(
    title: "Agribank",
    balance: 1328,
    svgSrc: "assets/icons/Documents.svg",
    color: primaryColor,
    percentage: 35,
  ),
];
