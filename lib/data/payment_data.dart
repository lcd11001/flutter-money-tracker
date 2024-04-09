import 'dart:math';

import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/models/payment_category.dart';

final random = Random();

class PaymentData {
  static void _sortData() {
    data.sort((a, b) => b.date.compareTo(a.date));
  }

  static List<PaymentTracking> data =
      List<PaymentTracking>.empty(growable: true);

  static List<PaymentTracking> init() {
    if (data.isEmpty) {
      data = _getSampleData();
      _sortData();
    }
    return data;
  }

  static void add(PaymentTracking payment) {
    data.add(payment);
    _sortData();
  }

  static PaymentTracking remove(String id) {
    // data.removeWhere((element) => element.id == id);
    final payment = data.firstWhere((element) => element.id == id);
    data.remove(payment);
    _sortData();
    return payment;
  }

  static List<PaymentTracking> _getSampleData() {
    return [
      PaymentTracking(
        title: 'Groceries',
        amount: 100.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.food,
      ),
      PaymentTracking(
        title: 'Fuel',
        amount: 50.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.travel,
      ),
      PaymentTracking(
        title: 'Shoes',
        amount: 200.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.shopping,
      ),
      PaymentTracking(
        title: 'Rent',
        amount: 500.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.housing,
      ),
      PaymentTracking(
        title: 'Medicine',
        amount: 50.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.health,
      ),
      PaymentTracking(
        title: 'Movie',
        amount: 20.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.entertainment,
      ),
      PaymentTracking(
        title: 'Books',
        amount: 30.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.education,
      ),
      PaymentTracking(
        title: 'Laptop',
        amount: 500.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.work,
      ),
      PaymentTracking(
        title: 'Electricity',
        amount: 50.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.utilities,
      ),
      PaymentTracking(
        title: 'Spa',
        amount: 100.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.personalCare,
      ),
      PaymentTracking(
        title: 'Gym',
        amount: 50.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.fitness,
      ),
      PaymentTracking(
        title: 'Taxi',
        amount: 20.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.transportation,
      ),
      PaymentTracking(
        title: 'Insurance',
        amount: 100.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.insurance,
      ),
      PaymentTracking(
        title: 'Investment',
        amount: 500.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.investments,
      ),
      PaymentTracking(
        title: 'Savings',
        amount: 100.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.savings,
      ),
      PaymentTracking(
        title: 'Gift',
        amount: 50.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.giftsAndDonations,
      ),
      PaymentTracking(
        title: 'Pet Food',
        amount: 20.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.pets,
      ),
      PaymentTracking(
        title: 'School Fees',
        amount: 100.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.kids,
      ),
      PaymentTracking(
        title: 'Others',
        amount: 10.0,
        date: DateTime.now().subtract(
          Duration(
            days: random.nextInt(10),
            hours: random.nextInt(24),
            minutes: random.nextInt(60),
          ),
        ),
        category: Category.others,
      ),
    ];
  }
}
