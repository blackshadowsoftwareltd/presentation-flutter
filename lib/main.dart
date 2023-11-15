import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'modules/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init().then(
    (_) => runApp(
      ProviderScope(
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          home: const Root(),
        ),
      ),
    ),
  );
}

Future _init() async {
  AppLifecycleListener(
    onStateChange: (v) => debugPrint('AppLifecycleListener: $v'),
  );
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
