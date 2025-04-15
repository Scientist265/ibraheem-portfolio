import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibraheem_portfolio/constants/app_colors.dart';
import 'package:ibraheem_portfolio/pages/about_page.dart';
import 'package:ibraheem_portfolio/pages/contact_page.dart';
import 'package:ibraheem_portfolio/pages/project_page.dart';
import 'package:ibraheem_portfolio/widgets/animated_button.dart';
import 'package:ibraheem_portfolio/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AboutPage(),
    const ProjectsPage(),
    const ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = AppColors(isDark: isDark);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: CustomAppBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            index,
            duration: 500.ms,
            curve: Curves.easeInOut,
          );
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      floatingActionButton: AnimatedButton(
        onPressed: () {
          // Add your action here
        },
        child: Text(
          'Hire Me',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ).animate().scale(delay: 1000.ms),
    );
  }
}
