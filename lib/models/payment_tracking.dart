import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  kFood,
  kTravel,
  kShopping,
  kHousing,
  kHealth,
  kEntertainment,
  kEducation,
  kOther,
}

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
}
