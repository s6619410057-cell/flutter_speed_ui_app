import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/view/e03_page_ui.dart';
import 'package:flutter_speed_ui_app/view/e04_page_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class E02PageUi extends StatefulWidget {
  const E02PageUi({super.key});

  @override
  State<E02PageUi> createState() => _E02PageUiState();
}

class _E02PageUiState extends State<E02PageUi> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          const designWidth = 390.0;
          const designHeight = 844.0;
          final widthScale = width / designWidth;
          final heightScale = height / designHeight;
          final minScale = widthScale < heightScale ? widthScale : heightScale;
          final isTablet = width >= 600;
          final isLargeScreen = width >= 900;
          final scale = minScale.clamp(0.85, 1.8);
          final contentMaxWidth =
              isLargeScreen ? 560.0 : (isTablet ? 500.0 : width);
          final horizontalPadding = (24.0 * scale).clamp(20.0, 32.0);
          final headerImageHeight =
              ((width * (313 / 360)) * scale).clamp(210.0, 420.0);
          final headerSectionHeight =
              ((height * 0.34) * scale).clamp(220.0, 380.0);
          final contentTopGap = ((height * 0.015) * scale).clamp(4.0, 16.0);
          final bottomGap = ((height * 0.035) * scale).clamp(18.0, 36.0);

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                children: [
                  SizedBox(
                    height: headerSectionHeight,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/Ellipse 1.png',
                            height: headerImageHeight,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          top:
                              MediaQuery.of(context).padding.top + (18 * scale),
                          left: (20.0 * scale).clamp(18.0, 28.0),
                          child: Container(
                            width: (35 * scale).clamp(32.0, 40.0),
                            height: (35 * scale).clamp(32.0, 40.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 252, 242, 204),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                size: (20 * scale).clamp(16.0, 22.0),
                              ),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: contentMaxWidth),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          children: [
                            SizedBox(height: contentTopGap),
                            Text(
                              'Welcome Back',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 30 * scale,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 30, 35, 44),
                              ),
                            ),
                            SizedBox(height: 5 * scale),
                            Text(
                              'Login to your account',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 18 * scale,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 37, 37, 37),
                              ),
                            ),
                            SizedBox(height: 20 * scale),
                            FractionallySizedBox(
                              widthFactor: isTablet ? 0.88 : 0.94,
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0 * scale,
                                    horizontal: 20.0,
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  hintText: 'Enter email or phone',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 12 * scale,
                                    fontWeight: FontWeight.normal,
                                    color: const Color.fromARGB(
                                        255, 131, 145, 161),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15 * scale),
                            FractionallySizedBox(
                              widthFactor: isTablet ? 0.88 : 0.94,
                              child: TextField(
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0 * scale,
                                    horizontal: 20.0,
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  hintText: 'Password',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 12 * scale,
                                    fontWeight: FontWeight.normal,
                                    color: const Color.fromARGB(
                                        255, 131, 145, 161),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color.fromARGB(
                                          255, 131, 145, 161),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10 * scale),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const E04PageUi(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 247, 149, 21),
                                    fontSize: 11 * scale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25 * scale),
                            FractionallySizedBox(
                              widthFactor: isTablet ? 0.88 : 0.94,
                              child: Container(
                                width: double.infinity,
                                height: 50 * scale,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 255, 197, 42),
                                      Color.fromARGB(255, 246, 149, 21),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Log In',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20 * scale,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15 * scale),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromARGB(255, 255, 255, 255),
                                          Color.fromARGB(255, 247, 149, 21),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(99),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: (10.0 * scale).clamp(8.0, 14.0)),
                                Text(
                                  'OR',
                                  style: GoogleFonts.roboto(
                                    color:
                                        const Color.fromARGB(255, 70, 70, 70),
                                    fontSize: 20 * scale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                    width: (10.0 * scale).clamp(8.0, 14.0)),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromARGB(255, 247, 149, 21),
                                          Color.fromARGB(255, 255, 255, 255),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(99),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20 * scale),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 32 * scale,
                                  icon: Image.asset(
                                    'assets/images/Google logo.png',
                                    width: 32 * scale,
                                    height: 32 * scale,
                                  ),
                                ),
                                SizedBox(width: 15 * scale),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 32 * scale,
                                  icon: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color:
                                        const Color.fromARGB(255, 24, 119, 242),
                                    size: 32 * scale,
                                  ),
                                ),
                                SizedBox(width: 15 * scale),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 32 * scale,
                                  icon: FaIcon(
                                    FontAwesomeIcons.apple,
                                    color: Colors.black,
                                    size: 32 * scale,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25 * scale),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account? ',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 15 * scale,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 30, 35, 44),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const E03PageUi(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Create Account',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 15 * scale,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 247, 149, 21),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: bottomGap),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
