import 'package:flutter/material.dart';
import 'package:khidma/features/auth/helper_login_screen/widget/buildHeader.dart';
import 'package:khidma/features/auth/helper_login_screen/widget/buildLoginCard.dart';
import 'package:khidma/features/auth/helper_login_screen/widget/buildRegisterCard.dart';
import 'package:khidma/features/auth/helper_login_screen/widget/glassCard.dart';

class HelperLoginScreen extends StatefulWidget {
  const HelperLoginScreen({super.key});

  @override
  State<HelperLoginScreen> createState() => _HelperLoginScreenState();
}

class _HelperLoginScreenState extends State<HelperLoginScreen>
    with TickerProviderStateMixin {
  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  late AnimationController _loginCardCtrl;
  late AnimationController _registerCardCtrl;
  late Animation<double> _fadeLogin;
  late Animation<Offset> _slideLogin;
  late Animation<double> _fadeRegister;
  late Animation<Offset> _slideRegister;

  @override
  void initState() {
    super.initState();
    _loginCardCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _fadeLogin = CurvedAnimation(parent: _loginCardCtrl, curve: Curves.easeOut);

    _slideLogin = Tween<Offset>(begin: const Offset(0, 0.20), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _loginCardCtrl, curve: Curves.easeOutCubic),
        );
    _registerCardCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeRegister = CurvedAnimation(
      parent: _registerCardCtrl,
      curve: Curves.easeOut,
    );

    _slideRegister =
        Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero).animate(
          CurvedAnimation(parent: _registerCardCtrl, curve: Curves.easeOutBack),
        );
    _loginCardCtrl.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _registerCardCtrl.forward();
    });
  }

  @override
  void dispose() {
    _loginCardCtrl.dispose();
    _registerCardCtrl.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F64FF), Color(0xFF4E9CFF), Color(0xFF223C8B)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + inset),
            child: Column(
              children: [
                buildHeader(context),
                const SizedBox(height: 20),

                /// LOGIN CARD
                FadeTransition(
                  opacity: _fadeLogin,
                  child: SlideTransition(
                    position: _slideLogin,
                    child: glassCard(child: buildLoginCard(context)),
                  ),
                ),

                const SizedBox(height: 24),

                /// REGISTER CARD
                FadeTransition(
                  opacity: _fadeRegister,
                  child: SlideTransition(
                    position: _slideRegister,
                    child: glassCard(child: buildRegisterCard(context)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
