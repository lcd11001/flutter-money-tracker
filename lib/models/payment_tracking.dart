import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/models/payment_category.dart';

final dateLongFormatter = DateFormat("dd MMM yyyy'\n'h:mm aaa");
final dateShortFormatter = DateFormat("dd MMM yyyy");
final amountFormatter = NumberFormat.simpleCurrency(decimalDigits: 2);
const uuid = Uuid();

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
  String get formattedDate => formattedShortDate;
  String get formattedAmount => amountFormatter.format(amount);
  IconData? get icon => categoryIcons[category];
}
