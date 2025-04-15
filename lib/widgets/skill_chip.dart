import 'package:flutter/material.dart';
import 'package:ibraheem_portfolio/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = AppColors(isDark: isDark);

    return Chip(
      label: Text(
        skill,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: colors.primary.withOpacity(0.1),
      labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: colors.primary.withOpacity(0.3),
          width: 1,
        ),
      ),
    );
  }
}
