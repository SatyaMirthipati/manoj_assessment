import 'package:flutter/material.dart';

import 'resources/theme.dart';
import 'ui/screens/auth/mobile_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const MobileScreen(),
      theme: AppTheme.theme,
    );
  }
}
