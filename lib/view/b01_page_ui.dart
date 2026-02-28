import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'b02_page_ui.dart';
import 'b03_page_ui.dart';

class B01PageUi extends StatefulWidget {
  const B01PageUi({super.key});

  @override
  State<B01PageUi> createState() => _B01PageUiState();
}

class _B01PageUiState extends State<B01PageUi> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final decoScale = (screenSize.width / 390.0).clamp(0.85, 1.8);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -360 * decoScale,
            right: -350 * decoScale,
            child: Container(
              width: 635 * decoScale,
              height: 635 * decoScale,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 239, 246, 255),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -175 * decoScale,
            right: -150 * decoScale,
            child: Container(
              width: 496 * decoScale,
              height: 496 * decoScale,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 239, 246, 255),
                  width: 4,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50 * decoScale,
            left: -90 * decoScale,
            child: Transform.rotate(
              angle: 25 * 3.14159 / 180,
              child: Container(
                width: 200 * decoScale,
                height: 250 * decoScale,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 239, 246, 255),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -15 * decoScale,
            left: -95 * decoScale,
            child: Container(
              width: 180 * decoScale,
              height: 250 * decoScale,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 239, 246, 255),
                  width: 2,
                ),
              ),
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                final h = constraints.maxHeight;
                const designWidth = 390.0;
                const designHeight = 844.0;
                final widthScale = w / designWidth;
                final heightScale = h / designHeight;
                final minScale =
                    widthScale < heightScale ? widthScale : heightScale;
                final safeScale = minScale.clamp(0.85, 1.8);
                final isCompactHeight = h < 700;
                final contentWidth = w;

                final horizontalPadding = (16.0 * safeScale).clamp(16.0, 36.0);
                final topGap = (14.0 * safeScale).clamp(14.0, 28.0);
                final imageWidth =
                    ((contentWidth * 0.92) * safeScale).clamp(260.0, 760.0);
                final titleSize = (35.0 * safeScale).clamp(30.0, 52.0);
                final descSize = (14.0 * safeScale).clamp(14.0, 20.0);
                final buttonHeight = (60.0 * safeScale).clamp(60.0, 72.0);
                final buttonFontSize = (20.0 * safeScale).clamp(20.0, 24.0);
                final gapAfterImage = (26.0 * safeScale).clamp(16.0, 34.0);
                final gapAfterTitle = (18.0 * safeScale).clamp(12.0, 24.0);
                final gapBeforeButtons = (54.0 * safeScale).clamp(28.0, 66.0);

                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: h),
                    child: Align(
                      alignment: isCompactHeight
                          ? Alignment.topCenter
                          : Alignment.center,
                      child: SizedBox(
                        width: contentWidth,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: topGap),
                              Center(
                                child: Image.asset(
                                  'assets/images/welcome image.png',
                                  width: imageWidth,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const SizedBox.shrink();
                                  },
                                ),
                              ),
                              SizedBox(height: gapAfterImage),
                              Text(
                                'Discover Your\nDream Job here',
                                style: GoogleFonts.poppins(
                                  fontSize: titleSize,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 31, 59, 184),
                                  height: 1.12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: gapAfterTitle),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      (8.0 * safeScale).clamp(8.0, 16.0),
                                ),
                                child: Text(
                                  'Explore all the existing job roles based on your interest and study major',
                                  style: GoogleFonts.poppins(
                                    fontSize: descSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    height: 1.6,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: gapBeforeButtons),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const B02PageUi(),
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 31, 59, 184),
                                        padding: EdgeInsets.symmetric(
                                          vertical: buttonHeight / 3,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: buttonFontSize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (16.0 * safeScale).clamp(16.0, 24.0),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const B03PageUi(),
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                          vertical: buttonHeight / 3,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        'Register',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: buttonFontSize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: isCompactHeight
                                    ? (20.0 * safeScale).clamp(18.0, 28.0)
                                    : (32.0 * safeScale).clamp(24.0, 40.0),
                              ),
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
        ],
      ),
    );
  }
}
