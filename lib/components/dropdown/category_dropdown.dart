import 'package:flutter/material.dart';
import 'package:money_tracker/models/payment_category.dart';
import 'package:money_tracker/utils/utils.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category _selectedCategory = Category.others;

  get _dropdownMenuEntries {
    return Category.values.map((category) {
      return DropdownMenuItem<Category>(
        value: category,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(categoryIcons[category], size: 16.0),
            const SizedBox(width: 10.0),
            Text(
              convertCamelCaseToTitle(category.toString().split('.').last),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      isExpanded: true,
      value: _selectedCategory,
      items: _dropdownMenuEntries,
      onChanged: (value) {
        debugPrint(value.toString());
        if (value != null) {
          setState(() {
            _selectedCategory = value;
          });
        }
      },
    );
  }
}
