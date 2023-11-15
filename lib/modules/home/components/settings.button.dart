import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/helpers/extensions/context.dart';
import 'package:presentation/modules/settings/settings.dart';

class SettingsButton extends ConsumerWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            onPressed: () async => await context.push(const SettingsScreen()), icon: const Icon(Icons.settings)));
  }
}
