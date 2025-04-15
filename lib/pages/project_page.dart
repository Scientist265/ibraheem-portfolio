import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibraheem_portfolio/constants/app_colors.dart';
import 'package:ibraheem_portfolio/constants/app_texts.dart';
import 'package:ibraheem_portfolio/widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

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
          Text(
            'My Projects',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 16),
          Text(
            'Here are some of my recent projects',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: colors.secondaryText,
            ),
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.9,
            ),
            itemCount: texts.projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(
                project: texts.projects[index],
              ).animate().fadeIn(delay: (400 + (index * 100)).ms);
            },
          ),
        ],
      ),
    );
  }
}
