import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final loc = AppLocalizations.of(context)!;

    return InputDecorator(
      decoration: InputDecoration(
        labelText: loc.inputCategory,
        border: const UnderlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Category>(
          isExpanded: true,
          isDense: true,
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
        ),
      ),
    );
  }
}
