import 'dart:math';

import 'package:money_tracker/models/payment_tracking.dart';

final random = Random();

class PaymentData {
  static List<PaymentTracking> data =
      List<PaymentTracking>.empty(growable: true);

  static List<PaymentTracking> init() {
    if (data.isEmpty) {
      data = _getSampleData();
    }
    return data;
  }

  static List<PaymentTracking> _getSampleData() {
    return [
      PaymentTracking(
        title: 'Groceries',
        amount: 100.0,
        date: DateTime.now().subtract(
          Duration(days: random.nextInt(10)),
        ),
        category: Category.kFood,
      ),
      PaymentTracking(
        title: 'Fuel',
        amount: 50.0,
        date: DateTime.now().subtract(
          Duration(days: random.nextInt(10)),
        ),
        category: Category.kTravel,
      ),
      PaymentTracking(
        title: 'Shoes',
        amount: 200.0,
        date: DateTime.now().subtract(
          Duration(days: random.nextInt(10)),
        ),
        category: Category.kShopping,
      ),
      PaymentTracking(
        title: 'Rent',
        amount: 1000.0,
        date: DateTime.now().subtract(
          Duration(days: random.nextInt(10)),
        ),
        category: Category.kHousing,
      ),
      PaymentTracking(
        title: 'Medicine',
        amount: 50.0,
        date: DateTime.now().subtract(
          Duration(days: random.nextInt(10)),
        ),
        category: Category.kHealth,
      ),
      PaymentTracking(
        title: 'Movie',
        amount: 20.0,
        date: DateTime.now().subtract(
          Duration(days: random.nextInt(10)),
        ),
        category: Category.kEntertainment,
      ),
      PaymentTracking(
        title: 'Books',
        amount: 30.0,
        date: DateTime.now().subtract(
          Duration(days: random.nextInt(10)),
        ),
        category: Category.kEducation,
      ),
      PaymentTracking(
        title: 'Others',
        amount: 10.0,
        date: DateTime.now().subtract(
          Duration(days: random.nextInt(10)),
        ),
        category: Category.kOther,
      ),
    ];
  }
}
