import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/models/payment_category.dart';

final dateFormatter = DateFormat("dd MMM yyyy 'at' h:mm aaa");
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

  String get formattedDate => dateFormatter.format(date);
  String get formattedAmount => amountFormatter.format(amount);
  IconData get icon => categoryIcons.containsKey(category)
      ? categoryIcons[category]!
      : categoryIcons[Category.other]!;
}
