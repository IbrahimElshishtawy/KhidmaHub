import 'dart:math';
import 'package:flutter/material.dart';
import 'onboarding_page_data.dart';

/// A single onboarding page with a 3D-like animated icon,
/// floating particles, and smooth text transitions.
class Onboarding3dView extends StatefulWidget {
  final OnboardingPageData pageData;
  final bool isActive;

  const Onboarding3dView({
    super.key,
    required this.pageData,
    required this.isActive,
  });

  @override
  State<Onboarding3dView> createState() => _Onboarding3dViewState();
}

class _Onboarding3dViewState extends State<Onboarding3dView>
    with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late AnimationController _pulseController;
  late AnimationController _textController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Continuous 3D rotation for the hero icon
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    // Pulse glow effect
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Text entrance animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _textFadeAnimation = CurvedAnimation(
      parent: _textController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: const Interval(0.1, 1.0, curve: Curves.easeOutCubic),
    ));
  }

  @override
  void didUpdateWidget(covariant Onboarding3dView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _textController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _pulseController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Start text animation when first built as active
    if (widget.isActive && !_textController.isAnimating && _textController.value == 0) {
      _textController.forward();
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.pageData.gradientColors,
        ),
      ),
      child: Stack(
        children: [
          // Floating particles
          ...List.generate(widget.pageData.floatingIcons.length, (index) {
            return _FloatingIcon(
              icon: widget.pageData.floatingIcons[index],
              index: index,
              totalIcons: widget.pageData.floatingIcons.length,
              screenSize: size,
            );
          }),

          // Decorative circles
          Positioned(
            top: -size.width * 0.3,
            right: -size.width * 0.2,
            child: Container(
              width: size.width * 0.7,
              height: size.width * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -size.width * 0.2,
            left: -size.width * 0.3,
            child: Container(
              width: size.width * 0.6,
              height: size.width * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.04),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // 3D Hero Icon with glow
                  AnimatedBuilder(
                    animation: Listenable.merge([_rotateController, _pulseController]),
                    builder: (context, child) {
                      final rotateValue = _rotateController.value * 2 * pi;
                      final scale = _pulseAnimation.value;

                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(sin(rotateValue) * 0.15)
                          ..rotateX(cos(rotateValue) * 0.08)
                          ..scale(scale),
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withValues(alpha: 0.25),
                                Colors.white.withValues(alpha: 0.1),
                              ],
                            ),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: widget.pageData.gradientColors.last.withValues(alpha: 0.5),
                                blurRadius: 40,
                                spreadRadius: 5,
                              ),
                              BoxShadow(
                                color: Colors.white.withValues(alpha: 0.1),
                                blurRadius: 20,
                                offset: const Offset(-5, -5),
                              ),
                            ],
                          ),
                          child: Icon(
                            widget.pageData.icon,
                            size: 72,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),

                  const Spacer(flex: 2),

                  // Title
                  FadeTransition(
                    opacity: _textFadeAnimation,
                    child: SlideTransition(
                      position: _textSlideAnimation,
                      child: Text(
                        widget.pageData.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Description
                  FadeTransition(
                    opacity: _textFadeAnimation,
                    child: SlideTransition(
                      position: _textSlideAnimation,
                      child: Text(
                        widget.pageData.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A floating, orbiting icon particle for visual flair.
class _FloatingIcon extends StatefulWidget {
  final IconData icon;
  final int index;
  final int totalIcons;
  final Size screenSize;

  const _FloatingIcon({
    required this.icon,
    required this.index,
    required this.totalIcons,
    required this.screenSize,
  });

  @override
  State<_FloatingIcon> createState() => _FloatingIconState();
}

class _FloatingIconState extends State<_FloatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _startX;
  late double _startY;
  late double _radiusX;
  late double _radiusY;

  @override
  void initState() {
    super.initState();
    final random = Random(widget.index * 42);

    _startX = random.nextDouble() * widget.screenSize.width;
    _startY = (widget.screenSize.height * 0.15) +
        random.nextDouble() * (widget.screenSize.height * 0.5);
    _radiusX = 15 + random.nextDouble() * 25;
    _radiusY = 15 + random.nextDouble() * 25;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4 + random.nextInt(4)),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final angle = _controller.value * 2 * pi;
        return Positioned(
          left: _startX + cos(angle) * _radiusX,
          top: _startY + sin(angle) * _radiusY,
          child: Opacity(
            opacity: 0.15 + (sin(angle) * 0.1),
            child: Icon(
              widget.icon,
              size: 28,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
