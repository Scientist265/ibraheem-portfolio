import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ibraheem_portfolio/constants/app_colors.dart';
import 'package:ibraheem_portfolio/constants/app_texts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
            'Get In Touch',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 16),
          Text(
            'Feel free to reach out for collaborations or just a friendly hello',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: colors.secondaryText,
            ),
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: 32),
          _buildContactForm(colors),
          const SizedBox(height: 40),
          Text(
            'Connect with me',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: colors.text,
            ),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 16),
          Row(
            children: [
              ...texts.socialLinks.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: Image.asset(
                      entry.value['icon']!,
                      width: 32,
                      height: 32,
                      color: colors.primary,
                    ),
                    onPressed: () => _launchURL(entry.value['url']!),
                  ),
                ).animate().fadeIn(
                    delay: (500 +
                            (texts.socialLinks.keys
                                    .toList()
                                    .indexOf(entry.key) *
                                100))
                        .ms);
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(AppColors colors) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: GoogleFonts.poppins(color: colors.text),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colors.primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colors.primary, width: 2),
              ),
            ),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: GoogleFonts.poppins(color: colors.text),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colors.primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colors.primary, width: 2),
              ),
            ),
          ).animate().fadeIn(delay: 500.ms),
          const SizedBox(height: 16),
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Message',
              labelStyle: GoogleFonts.poppins(color: colors.text),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colors.primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colors.primary, width: 2),
              ),
            ),
          ).animate().fadeIn(delay: 600.ms),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Send Message',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ).animate().fadeIn(delay: 700.ms),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
