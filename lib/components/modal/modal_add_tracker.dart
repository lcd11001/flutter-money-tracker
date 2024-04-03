import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModalAddTracker extends StatefulWidget {
  const ModalAddTracker({super.key});

  @override
  State<StatefulWidget> createState() => _ModalAddTrackerState();
}

class _ModalAddTrackerState extends State<ModalAddTracker> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

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
            ),
            TextField(
              decoration: InputDecoration(
                labelText: loc.inputAmount,
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: loc.inputDate,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(loc.buttonAdd),
            ),
          ],
        ));
  }
}
