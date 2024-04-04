import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/components/dropdown/category_dropdown.dart';
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
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = null;

    Future.delayed(Duration.zero, () {
      _dateController.text = AppLocalizations.of(context)!.inputDatePlaceholder;
    });
  }

  void setStateSubmitting(bool value) {
    setState(() {
      _isSubmitting = value;
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
                errorText: _isSubmitting && !_validateTitle()
                    ? loc.errorTitleRequired
                    : null,
              ),
              maxLength: 50,
              keyboardType: TextInputType.text,
              onChanged: (_) => setStateSubmitting(false),
              controller: _titleController,
            ),
            // const SizedBox(
            //   height: 0.0,
            // ),
            TextField(
              decoration: InputDecoration(
                labelText: loc.inputAmount,
                prefixText: '${amountFormatter.currencySymbol} ',
                errorText: _isSubmitting && !_validateAmount()
                    ? loc.errorAmountRequired
                    : null,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ThousandsFormatter(),
              ],
              onChanged: (_) => setStateSubmitting(false),
              controller: _amountController,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: loc.inputDate,
                suffixIcon: const Icon(Icons.calendar_month),
                errorText: _isSubmitting && !_validateDate()
                    ? loc.errorDateInvalid
                    : null,
              ),
              readOnly: true,
              onTap: _showDatePicker,
              controller: _dateController,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const CategoryDropdown(),
            const SizedBox(
              height: 16.0,
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
                        _submitPayment();
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

  void _submitPayment() {
    setStateSubmitting(true);

    if (!_validateTitle() || !_validateAmount() || !_validateDate()) {
      _showErrorDialog();
      return;
    }
  }

  bool _validateTitle() {
    if (_titleController.text.trim().isEmpty) {
      return false;
    }
    return true;
  }

  bool _validateAmount() {
    if (_amountController.text.trim().isEmpty) {
      return false;
    }

    double amount = double.tryParse(_amountController.text) ?? 0.0;
    if (amount <= 0.0) {
      return false;
    }

    return true;
  }

  bool _validateDate() {
    return _selectedDate != null;
  }

  void _showErrorDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          final loc = AppLocalizations.of(ctx)!;

          return AlertDialog(
            title: Text(loc.errorDialogTitle),
            content: Text(loc.errorDialogMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text(loc.buttonClose),
              ),
            ],
          );
        });
  }
}
