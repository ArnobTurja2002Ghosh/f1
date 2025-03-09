import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/theme_provider.dart';
import 'home_page.dart';

class HomePage1 extends ConsumerWidget {
  const HomePage1({super.key});
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(themeProvider);
    print(isDark);
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
    return MaterialApp(
      home: HomePage(),
      theme: themeData,
    );
  }
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    final Widget home_page_scaffold = HomePage();

    return MaterialApp(home: home_page_scaffold);
  }
}
