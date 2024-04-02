import 'package:flutter/material.dart';

enum Category {
  food,
  travel,
  shopping,
  housing,
  health,
  entertainment,
  education,
  work,
  utilities,
  personalCare,
  fitness,
  transportation,
  insurance,
  investments,
  savings,
  giftsAndDonations,
  pets,
  kids,
  other,
}

const Map<Category, IconData> categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.travel_explore,
  Category.shopping: Icons.shopping_cart,
  Category.housing: Icons.home,
  Category.health: Icons.local_hospital,
  Category.entertainment: Icons.diversity_2,
  Category.education: Icons.school,
  Category.work: Icons.work,
  Category.utilities: Icons.construction,
  Category.personalCare: Icons.spa,
  Category.fitness: Icons.fitness_center,
  Category.transportation: Icons.local_taxi,
  Category.insurance: Icons.security,
  Category.investments: Icons.attach_money,
  Category.savings: Icons.savings,
  Category.giftsAndDonations: Icons.card_giftcard,
  Category.pets: Icons.pets,
  Category.kids: Icons.child_friendly,
  Category.other: Icons.attach_money,
};
