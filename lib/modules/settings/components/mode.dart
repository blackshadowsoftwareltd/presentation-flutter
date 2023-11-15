import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/sealed/sealed.dart';
import '../providers/settings.dart';

class ChangeAppMode extends ConsumerWidget {
  const ChangeAppMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(appModeProvider);
    final modeChange = ref.watch(appModeProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text('App Mode'),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: switch (mode) {
              BasicMode() => null,
              _ => Colors.blue,
            }),
            onPressed: () => modeChange.toBasic(),
            child: const Text('Basic Mode'),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: switch (mode) {
                EditingMode() => null,
                _ => Colors.blue,
              }),
              onPressed: () => modeChange.toEditing(),
              child: const Text('Editing Mode')),
          const SizedBox(width: 5),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: switch (mode) {
                PreviewMode() => null,
                _ => Colors.blue,
              }),
              onPressed: () => modeChange.toPreview(),
              child: const Text('Preview Mode'))
        ],
      ),
    );
  }
}
