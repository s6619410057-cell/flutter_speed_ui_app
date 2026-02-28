import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/view/e02_page_ui.dart';
import 'package:flutter_speed_ui_app/view/e03_page_ui.dart';
import 'package:flutter_speed_ui_app/view/e05_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class E04PageUi extends StatelessWidget {
  const E04PageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            const designWidth = 390.0;
            const designHeight = 844.0;
            final widthScale = width / designWidth;
            final heightScale = height / designHeight;
            final minScale =
                widthScale < heightScale ? widthScale : heightScale;
            final isTablet = width >= 600;
            final isLargeScreen = width >= 900;
            final scale = minScale.clamp(0.85, 1.8);
            final contentMaxWidth =
                isLargeScreen ? 560.0 : (isTablet ? 500.0 : width);
            final horizontalPadding = (24.0 * scale).clamp(20.0, 32.0);
            final headerImageHeight =
                ((width * (313 / 360)) * scale).clamp(210.0, 420.0);
            final headerSectionHeight =
                ((height * 0.36) * scale).clamp(220.0, 380.0);
            final contentTopGap = ((height * 0.01) * scale).clamp(2.0, 12.0);
            final footerGap = ((height * 0.2) * scale).clamp(80.0, 180.0);

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
                              width: width,
                              height: headerImageHeight,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).padding.top +
                                (18 * scale),
                            left: 20 * scale,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const E02PageUi(),
                                  ),
                                );
                              },
                              child: Container(
                                width: (35 * scale).clamp(32.0, 40.0),
                                height: (35 * scale).clamp(32.0, 40.0),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 252, 242, 204),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: (20 * scale).clamp(16.0, 22.0),
                                  color: Colors.white,
                                ),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: contentTopGap),
                              Text(
                                'Forgot your password?',
                                style: GoogleFonts.poppins(
                                  fontSize: 20 * scale,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 29, 29, 29),
                                ),
                              ),
                              SizedBox(height: 2 * scale),
                              Text(
                                'Enter email address',
                                style: GoogleFonts.poppins(
                                  fontSize: 15 * scale,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 32, 32, 32),
                                ),
                              ),
                              SizedBox(height: 10 * scale),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 242, 242, 242),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14 * scale,
                                    vertical: 8 * scale,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 153, 153, 153),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 247, 149, 21),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 28 * scale),
                              SizedBox(
                                width: double.infinity,
                                height: 55 * scale,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
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
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const E05PageUi(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Send code',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20 * scale,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: footerGap),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t have an Account?',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12 * scale,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromARGB(255, 29, 29, 29),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const E03PageUi(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      ' Create account',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12 * scale,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 247, 149, 21),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
