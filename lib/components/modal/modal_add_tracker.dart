import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/utils/utils.dart';
import 'package:money_tracker/utils/thousands_formatter.dart';

class ModalAddTracker extends StatefulWidget {
  const ModalAddTracker({super.key});

  @override
  State<StatefulWidget> createState() => _ModalAddTrackerState();
}

class _ModalAddTrackerState extends State<ModalAddTracker> {
  /*
  String _inputTitle = '';

  _saveInputTitle(String value) {
    _inputTitle = value;
  }
  */
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = null;

    Future.delayed(Duration.zero, () {
      _dateController.text = AppLocalizations.of(context)!.inputDatePlaceholder;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  _closeModal(BuildContext context) {
    Navigator.pop(context);
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    var finalDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );

    if (finalDate != null) {
      debugPrint(finalDate.toString());
      setState(() {
        _selectedDate = finalDate;
        _dateController.text = dateShortFormatter.format(finalDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: loc.inputTitle,
              ),
              maxLength: 50,
              keyboardType: TextInputType.text,
              // onChanged: _saveInputTitle,
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: loc.inputAmount,
                prefixText: '${amountFormatter.currencySymbol} ',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ThousandsFormatter(),
              ],
              controller: _amountController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: loc.inputDate,
                suffixIcon: const Icon(Icons.calendar_month),
              ),
              readOnly: true,
              onTap: _showDatePicker,
              controller: _dateController,
            ),
            const SizedBox(
              height: 32.0,
            ),
            IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _closeModal(context);
                      },
                      icon: const Icon(Icons.cancel),
                      label: Text(loc.buttonCancel),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.error,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // debugPrint(_inputTitle);
                        debugPrint(_titleController.text);
                        debugPrint(_amountController.text);
                      },
                      icon: const Icon(Icons.add),
                      label: Text(loc.buttonAdd),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
