import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_routes.dart';

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

  // Animations
  late AnimationController _loginCardCtrl;
  late AnimationController _registerCardCtrl;

  late Animation<double> _fadeLogin;
  late Animation<Offset> _slideLogin;

  late Animation<double> _fadeRegister;
  late Animation<Offset> _slideRegister;

  @override
  void initState() {
    super.initState();

    // Animation 1 - Login Card
    _loginCardCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _fadeLogin = CurvedAnimation(parent: _loginCardCtrl, curve: Curves.easeOut);

    _slideLogin = Tween<Offset>(begin: const Offset(0, 0.20), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _loginCardCtrl, curve: Curves.easeOutCubic),
        );

    // Animation 2 - Register Card (delay)
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

    // Start animations
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
                _buildHeader(),
                const SizedBox(height: 20),

                /// LOGIN CARD
                FadeTransition(
                  opacity: _fadeLogin,
                  child: SlideTransition(
                    position: _slideLogin,
                    child: _glassCard(child: _buildLoginCard(context)),
                  ),
                ),

                const SizedBox(height: 24),

                /// REGISTER CARD
                FadeTransition(
                  opacity: _fadeRegister,
                  child: SlideTransition(
                    position: _slideRegister,
                    child: _glassCard(child: _buildRegisterCard(context)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Header
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "خدمة",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white.withOpacity(0.95),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "سجّل كمساعد وابدأ في استقبال الطلبات بسهولة",
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
        ),
      ],
    );
  }

  // Reusable Glass Card
  Widget _glassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.82),
            border: Border.all(color: Colors.white.withOpacity(0.85)),
            borderRadius: BorderRadius.circular(22),
          ),
          child: child,
        ),
      ),
    );
  }

  //--------------------------------------------------------------------
  // LOGIN CARD
  //--------------------------------------------------------------------
  Widget _buildLoginCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.support_agent_outlined,
              color: Color(0xFF0F64FF),
              size: 26,
            ),
            Text(
              "تسجيل الدخول",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Email
        TextField(
          controller: _emailController,
          textDirection: TextDirection.rtl,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            labelText: "البريد الإلكتروني",
            hintText: "ادخل بريدك الإلكتروني",
          ),
        ),

        const SizedBox(height: 12),

        // Password
        TextField(
          controller: _passwordController,
          obscureText: true,
          textDirection: TextDirection.rtl,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            labelText: "كلمة المرور",
            hintText: "ادخل كلمة المرور",
          ),
        ),

        const SizedBox(height: 8),

        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "هل نسيت كلمة المرور؟",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.helperHome);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text("تسجيل الدخول", style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }

  //--------------------------------------------------------------------
  // REGISTER CARD
  //--------------------------------------------------------------------
  Widget _buildRegisterCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "إنشاء حساب جديد",
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),

        const SizedBox(height: 16),

        TextField(
          controller: _nameController,
          textDirection: TextDirection.rtl,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_outline),
            labelText: "الاسم الكامل",
          ),
        ),

        const SizedBox(height: 12),

        TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          textDirection: TextDirection.rtl,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.phone_outlined),
            labelText: "رقم الهاتف",
          ),
        ),

        const SizedBox(height: 12),

        TextField(
          controller: _cityController,
          textDirection: TextDirection.rtl,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.location_on_outlined),
            labelText: "المدينة",
          ),
        ),

        const SizedBox(height: 18),

        _buildIdUploadBox(),

        const SizedBox(height: 18),

        SizedBox(
          height: 46,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.helperHome);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF0F64FF), width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              "إنشاء حساب",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF0F64FF),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  //--------------------------------------------------------------------
  // ID Upload Widget
  //--------------------------------------------------------------------
  Widget _buildIdUploadBox() {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        color: Colors.white.withOpacity(0.55),
      ),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xFFE8F0FF),
            ),
            child: const Icon(
              Icons.badge_outlined,
              size: 28,
              color: Color(0xFF0066FF),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "إرفاق الهوية (Mock UI فقط)",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "قم برفع صورة الهوية أو الإقامة للتحقق من حسابك.",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
