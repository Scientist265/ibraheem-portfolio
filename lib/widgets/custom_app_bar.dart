import 'package:flutter/material.dart';
import 'package:ibraheem_portfolio/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomAppBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = AppColors(isDark: isDark);

    return AppBar(
      backgroundColor: colors.background,
      elevation: 0,
      title: Text(
        'My Portfolio',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: colors.primary,
        ),
      ),
      actions: [
        _buildNavItem('About', 0, colors),
        _buildNavItem('Projects', 1, colors),
        _buildNavItem('Contact', 2, colors),
        const SizedBox(width: 24),
      ],
    );
  }

  Widget _buildNavItem(String text, int index, AppColors colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => onItemSelected(index),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: currentIndex == index ? colors.primary : colors.text,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
