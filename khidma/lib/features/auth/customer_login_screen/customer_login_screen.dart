// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:khidma/features/auth/customer_login_screen/widget/AnimatedLoginCard.dart';
import 'package:khidma/features/auth/customer_login_screen/widget/HeaderBar.dart';
import 'package:khidma/features/auth/customer_login_screen/widget/SocialButtons.dart';
import 'package:khidma/features/auth/customer_login_screen/widget/SocialDivider.dart';
import 'package:khidma/features/auth/customer_login_screen/widget/TitleSection.dart';

class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({super.key});

  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewInsetsBottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF0F64FF), Color(0xFF4E9CFF), Color(0xFF223C8B)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Container(color: Colors.black.withOpacity(0.05)),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      24,
                      24,
                      24,
                      24 + viewInsetsBottom,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - viewInsetsBottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeaderBar(),
                          const SizedBox(height: 24),
                          TitleSection(),
                          const SizedBox(height: 28),
                          AnimatedLoginCard(
                            fadeAnimation: _fadeAnimation,
                            slideAnimation: _slideAnimation,
                            emailController: _emailController,
                            passwordController: _passwordController,
                          ),
                          const SizedBox(height: 24),
                          SocialDivider(),
                          const SizedBox(height: 16),
                          SocialButtons(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
