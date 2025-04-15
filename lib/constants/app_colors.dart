import 'package:flutter/material.dart';

class AppColors {
  final bool isDark;

  AppColors({required this.isDark});

  Color get background =>
      isDark ? const Color(0xFF121212) : const Color(0xFFFAFAFA);
  Color get primary =>
      isDark ? const Color(0xFFBB86FC) : const Color(0xFF6200EE);
  Color get text => isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  Color get secondaryText =>
      isDark ? const Color(0xFFB3B3B3) : const Color(0xFF757575);
  Color get card => isDark ? const Color(0xFF1E1E1E) : const Color(0xFFFFFFFF);
  Color get divider =>
      isDark ? const Color(0xFF333333) : const Color(0xFFE0E0E0);
}
