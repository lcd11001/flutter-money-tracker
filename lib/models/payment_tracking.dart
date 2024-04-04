import 'package:flutter/material.dart';

import 'package:money_tracker/models/payment_category.dart';
import 'package:money_tracker/utils/utils.dart';

class PaymentTracking {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  PaymentTracking({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedShortDate => dateShortFormatter.format(date);
  String get formattedLongDate => dateLongFormatter.format(date);
  String get formattedDate => formattedLongDate;
  String get formattedAmount => amountFormatter.format(amount);
  IconData? get icon => categoryIcons[category];
}
