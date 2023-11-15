import 'package:flutter/material.dart';

import 'components/settings.button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: const [SettingsButton()],
      ),
    );
  }
}
