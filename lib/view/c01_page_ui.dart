import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'c02_page_ui.dart';

class C01PageUi extends StatefulWidget {
  const C01PageUi({super.key});

  @override
  State<C01PageUi> createState() => _C01PageUiState();
}

class _C01PageUiState extends State<C01PageUi> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const C02PageUi(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;
          const designWidth = 390.0;
          const designHeight = 844.0;
          final widthScale = w / designWidth;
          final heightScale = h / designHeight;
          final minScale = widthScale < heightScale ? widthScale : heightScale;
          final safeScale = minScale.clamp(0.85, 1.8);

          final horizontalPadding = (16.0 * safeScale).clamp(16.0, 36.0);
          final topGap =
              ((h * 0.35) * safeScale).clamp(200.0, 520.0).toDouble();
          final logoSize = (120.0 * safeScale).clamp(100.0, 220.0);
          final titleSize = (36.0 * safeScale).clamp(30.0, 56.0);
          final messageSize = (30.0 * safeScale).clamp(24.0, 46.0);
          final gapBetweenTitleAndMessage =
              ((h * 0.12) * safeScale).clamp(64.0, 130.0).toDouble();

          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Smiley female volunteers posing together.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: h),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: topGap),
                            SizedBox(
                              width: logoSize,
                              height: logoSize,
                              child: const Image(
                                image: AssetImage('assets/images/vector.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height:
                                  ((h * 0.015) * safeScale).clamp(8.0, 20.0),
                            ),
                            Text(
                              'HOPE FOR',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: titleSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'HUMANITY',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: titleSize,
                                fontWeight: FontWeight.w700,
                                height: 0.95,
                              ),
                            ),
                            SizedBox(height: gapBetweenTitleAndMessage),
                            Text(
                              'Welcome to\nhope for humanity',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 27, 83, 36),
                                fontSize: messageSize,
                                fontWeight: FontWeight.w600,
                                height: 1.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
