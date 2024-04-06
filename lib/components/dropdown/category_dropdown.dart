import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:money_tracker/models/payment_category.dart';
import 'package:money_tracker/utils/utils.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key, required this.onCategorySelected});

  final ReturnCallback<void, Category> onCategorySelected;

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category _selectedCategory = Category.others;

  get _dropdownMenuEntries {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Category.values.map((category) {
      return DropdownMenuItem<Category>(
        value: category,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              categoryIcons[category],
              size: 24.0,
              color: colorScheme.tertiary,
            ),
            const SizedBox(width: 10.0),
            Text(
              convertCamelCaseToTitle(category.toString().split('.').last),
              style: textTheme.titleLarge,
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
            if (value != null) {
              setState(() {
                _selectedCategory = value;
              });
              widget.onCategorySelected(value);
            }
          },
        ),
      ),
    );
  }
}
