import 'package:flutter/material.dart';

import 'components/mode.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Column(
        children: [
          ChangeAppMode(),
        ],
      ),
    );
  }
}
