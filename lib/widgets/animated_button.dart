import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ibraheem_portfolio/constants/app_colors.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const AnimatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding,
    this.borderRadius,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = AppColors(isDark: isDark);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isTapped = true),
        onTapUp: (_) => setState(() => _isTapped = false),
        onTapCancel: () => setState(() => _isTapped = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: 200.ms,
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: colors.primary.withOpacity(0.3),
                      blurRadius: 16,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          transform: Matrix4.identity()
            ..scale(_isTapped
                ? 0.95
                : _isHovered
                    ? 1.05
                    : 1.0),
          child: widget.child,
        ),
      ),
    );
  }
}
