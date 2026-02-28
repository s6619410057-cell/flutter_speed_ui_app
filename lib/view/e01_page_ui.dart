import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'e02_page_ui.dart';

class E01PageUi extends StatelessWidget {
  const E01PageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            final safeScale = minScale.clamp(0.85, 1.8);
            final isTablet = width >= 600;
            final isLargeScreen = width >= 900;
            final scale = safeScale;
            final contentMaxWidth =
                isLargeScreen ? 680.0 : (isTablet ? 560.0 : width);
            final horizontalPadding = (24.0 * safeScale).clamp(20.0, 36.0);
            final imageWidth =
                ((width * (isTablet ? 0.58 : 0.88)) * safeScale).clamp(
              280.0,
              isLargeScreen ? 620.0 : 420.0,
            );
            final topGap = ((height * 0.03) * safeScale).clamp(12.0, 28.0);
            final ctaTopGap = ((height * 0.12) * safeScale).clamp(48.0, 90.0);
            final bottomGap = ((height * 0.05) * safeScale).clamp(26.0, 44.0);

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: contentMaxWidth),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: (16.0 * safeScale).clamp(12.0, 24.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: topGap),
                          Image.asset(
                            'assets/images/32365 1.png',
                            fit: BoxFit.contain,
                            width: imageWidth,
                          ),
                          SizedBox(height: 15 * scale),
                          Text(
                            'BERRY JUICE',
                            style: GoogleFonts.abrilFatface(
                              fontSize: 30 * scale,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.4,
                              shadows: const [
                                Shadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  color: Color.fromARGB(255, 229, 163, 41),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12 * scale),
                          Text(
                            'A “Moments of healthy sip\nThe best vitamin for your health',
                            style: GoogleFonts.googleSansFlex(
                              fontSize: 14 * scale,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              height: 1.35,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: ctaTopGap),
                          FractionallySizedBox(
                            widthFactor: isTablet ? 0.72 : 0.86,
                            child: SizedBox(
                              height: 50 * scale,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 248, 193, 90),
                                      Color.fromARGB(255, 240, 139, 0),
                                    ],
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const E02PageUi(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12 * scale,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 12 * scale),
                                      Text(
                                        'Explore Now',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20 * scale,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 26 * scale,
                                      ),
                                      SizedBox(width: 2 * scale),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: bottomGap),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
