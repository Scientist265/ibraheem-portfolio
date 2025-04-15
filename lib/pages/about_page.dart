import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibraheem_portfolio/constants/app_colors.dart';
import 'package:ibraheem_portfolio/constants/app_texts.dart';
import 'package:ibraheem_portfolio/widgets/skill_chip.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = AppColors(isDark: isDark);
    final texts = AppTexts();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(texts.profileImage),
              ).animate().fadeIn().scale(delay: 200.ms),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texts.name,
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: colors.primary,
                      ),
                    ).animate().fadeIn(delay: 300.ms),
                    Text(
                      texts.title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: colors.secondaryText,
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: 16),
                    Text(
                      texts.bio,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: colors.text,
                      ),
                    ).animate().fadeIn(delay: 500.ms),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Skills',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ).animate().fadeIn(delay: 600.ms),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: texts.skills
                .map((skill) => SkillChip(skill: skill))
                .toList()
                .animate(interval: 100.ms)
                .fadeIn()
                .slideX(begin: 0.2),
          ),
          const SizedBox(height: 40),
          Text(
            'Experience',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ).animate().fadeIn(delay: 700.ms),
          const SizedBox(height: 16),
          ...texts.experiences
              .map((exp) => _buildExperienceItem(exp, colors))
              .toList()
              .animate(interval: 100.ms)
              .fadeIn()
              .slideX(begin: 0.2),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(Map<String, String> exp, AppColors colors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exp['title']!,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.text,
            ),
          ),
          Text(
            '${exp['company']!} • ${exp['duration']!}',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: colors.secondaryText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            exp['description']!,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: colors.text,
            ),
          ),
        ],
      ),
    );
  }
}
