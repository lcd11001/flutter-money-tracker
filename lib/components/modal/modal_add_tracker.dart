import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:money_tracker/components/dropdown/category_dropdown.dart';
import 'package:money_tracker/models/payment_category.dart';
import 'package:money_tracker/models/payment_tracking.dart';
import 'package:money_tracker/utils/utils.dart';
import 'package:money_tracker/utils/thousands_formatter.dart';

class ModalAddTracker extends StatefulWidget {
  const ModalAddTracker({super.key, required this.onAddPayment});

  final Callback<PaymentTracking> onAddPayment;

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

  late Category _category;
  late DateTime? _selectedDate;
  late bool _isSubmitting;

  @override
  void initState() {
    super.initState();
    _selectedDate = null;
    _category = Category.others;
    _isSubmitting = false;

    Future.delayed(Duration.zero, () {
      _dateController.text = AppLocalizations.of(context)!.inputDatePlaceholder;
    });
  }

  void _onCategorySelected(Category value) {
    setState(() {
      _category = value;
    });
  }

  void _setStateSubmitting(bool value) {
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

  _closeModal() {
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
      setState(() {
        _selectedDate = DateTime(
          finalDate.year,
          finalDate.month,
          finalDate.day,
          // fixed: hour and minute to the current time
          now.hour,
          now.minute,
          now.second,
          now.millisecond,
        );
        _dateController.text = dateLongFormatter.format(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      // force the modal to take the full screen height
      height: MediaQuery.of(context).size.height,
      child: Padding(
        // 48.0 is the top padding to avoid the status bar
        padding: const EdgeInsets.fromLTRB(
          16.0,
          48.0,
          16.0,
          16.0,
        ),
        // wrap the content with SingleChildScrollView to avoid overflow in small screen
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: loc.inputTitle,
                  labelStyle: textTheme.titleMedium!,
                  errorText: _isSubmitting && !_validateTitle()
                      ? loc.errorTitleRequired
                      : null,
                ),
                style: textTheme.titleLarge,
                maxLength: 50,
                keyboardType: TextInputType.text,
                onChanged: (_) => _setStateSubmitting(false),
                controller: _titleController,
              ),
              // const SizedBox(
              //   height: 0.0,
              // ),
              TextField(
                decoration: InputDecoration(
                  labelText: loc.inputAmount,
                  labelStyle: textTheme.titleMedium!,
                  prefixText: '${amountFormatter.currencySymbol} ',
                  prefixStyle: textTheme.titleLarge!.copyWith(
                    color: colorScheme.tertiary,
                  ),
                  errorText: _isSubmitting && !_validateAmount()
                      ? loc.errorAmountRequired
                      : null,
                ),
                style: textTheme.titleLarge,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ThousandsFormatter(),
                ],
                onChanged: (_) => _setStateSubmitting(false),
                controller: _amountController,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: loc.inputDate,
                  labelStyle: textTheme.titleMedium!,
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: colorScheme.tertiary,
                  ),
                  errorText: _isSubmitting && !_validateDate()
                      ? loc.errorDateInvalid
                      : null,
                ),
                style: textTheme.titleLarge,
                readOnly: true,
                onTap: _showDatePicker,
                controller: _dateController,
              ),
              const SizedBox(
                height: 16.0,
              ),
              CategoryDropdown(
                onCategorySelected: _onCategorySelected,
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
                        onPressed: _closeModal,
                        icon: const Icon(Icons.cancel),
                        label: Text(loc.buttonCancel),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.tertiary,
                          foregroundColor: colorScheme.onTertiary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _submitPayment,
                        icon: const Icon(Icons.add),
                        label: Text(loc.buttonAdd),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitPayment() {
    _setStateSubmitting(true);

    if (!_validateTitle() || !_validateAmount() || !_validateDate()) {
      _showErrorDialog();
      return;
    }

    final newPayment = PaymentTracking(
      title: _titleController.text.trim(),
      amount: double.parse(_amountController.text.replaceAll(',', '')),
      date: _selectedDate!,
      category: _category,
    );

    widget.onAddPayment(newPayment);
    _closeModal();
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

    double amount =
        double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0.0;
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
