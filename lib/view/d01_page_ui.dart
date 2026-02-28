import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'd02_page_ui.dart';
import 'd03_page_ui.dart';

class D01PageUi extends StatefulWidget {
  const D01PageUi({super.key});

  @override
  State<D01PageUi> createState() => _D01PageUiState();
}

class _D01PageUiState extends State<D01PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          const designWidth = 390.0;
          const designHeight = 844.0;
          final widthScale = width / designWidth;
          final heightScale = height / designHeight;
          final minScale = widthScale < heightScale ? widthScale : heightScale;
          final safeScale = minScale.clamp(0.85, 1.8);
          final isLargeScreen = width >= 700;
          final contentWidth = width;
          final contentMaxWidth = isLargeScreen ? 540.0 : width;
          final topSpace = ((height * 0.40) * safeScale).clamp(200.0, 420.0);
          final brandingWidth =
              ((contentMaxWidth * 0.35) * safeScale).clamp(150.0, 220.0);
          final buttonVerticalPadding =
              ((height * 0.03) * safeScale).clamp(18.0, 25.0);

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: contentWidth,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: contentMaxWidth),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: (16.0 * safeScale).clamp(14.0, 24.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: topSpace),
                              Image.asset(
                                'assets/images/Branding.png',
                                width: brandingWidth,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                height: (40.0 * safeScale).clamp(32.0, 56.0),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const D02PageUi(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 27, 27, 27),
                                    padding: EdgeInsets.symmetric(
                                      vertical: buttonVerticalPadding,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize:
                                          (15.0 * safeScale).clamp(14.0, 20.0),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: (15.0 * safeScale).clamp(12.0, 22.0),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const D03PageUi(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: buttonVerticalPadding,
                                    ),
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 27, 27, 27),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Register',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize:
                                          (15.0 * safeScale).clamp(14.0, 20.0),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: (45.0 * safeScale).clamp(34.0, 64.0),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Continue as a guest',
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        (15.0 * safeScale).clamp(14.0, 20.0),
                                    color:
                                        const Color.fromARGB(255, 40, 183, 194),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        const Color.fromARGB(255, 40, 183, 194),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
