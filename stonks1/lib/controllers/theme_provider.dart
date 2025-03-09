import 'package:flutter_riverpod/flutter_riverpod.dart';

// A simple StateProvider that manages the isDark boolean value
final themeProvider = StateProvider<bool>((ref) => false);
