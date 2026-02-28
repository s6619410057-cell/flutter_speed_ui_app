import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'a02_page_ui.dart';

class A01PageUi extends StatefulWidget {
  const A01PageUi({super.key});

  @override
  State<A01PageUi> createState() => _A01PageUiState();
}

class _A01PageUiState extends State<A01PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;
            const designWidth = 390.0;
            const designHeight = 844.0;
            final widthScale = w / designWidth;
            final heightScale = h / designHeight;
            final scale = widthScale < heightScale ? widthScale : heightScale;
            final safeScale = scale.clamp(0.85, 1.8);
            final isCompactHeight = h < 700;

            final contentWidth = w;

            final horizontalPadding = (12.0 * safeScale).clamp(12.0, 32.0);
            final topPadding = isCompactHeight
                ? (10.0 * safeScale).clamp(10.0, 14.0)
                : (12.0 * safeScale).clamp(12.0, 18.0);

            final heroHeight = (h * 0.48 * safeScale).clamp(260.0, 560.0);
            final heroRadius = (36.0 * safeScale).clamp(36.0, 48.0);
            final titleSize = (30.0 * safeScale).clamp(24.0, 46.0);
            final descSize = (14.0 * safeScale).clamp(12.0, 20.0);
            final buttonHeight = (62.0 * safeScale).clamp(62.0, 80.0);
            final buttonFontSize = (18.0 * safeScale).clamp(18.0, 24.0);
            final gapS = (20.0 * safeScale).clamp(14.0, 24.0);
            final gapM = (28.0 * safeScale).clamp(18.0, 36.0);
            final gapL = (56.0 * safeScale).clamp(24.0, 64.0);

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: contentWidth,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding,
                        right: horizontalPadding,
                        top: topPadding,
                        bottom: isCompactHeight
                            ? (12.0 * safeScale).clamp(10.0, 14.0)
                            : (16.0 * safeScale).clamp(14.0, 22.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(heroRadius),
                              bottomRight: Radius.circular(heroRadius),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: heroHeight,
                              color: const Color.fromARGB(255, 255, 163, 235),
                              child: Image.asset(
                                'assets/images/Saly-1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: gapM),
                          Text(
                            'Discover Your',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 70, 66, 66),
                              fontSize: titleSize,
                            ),
                          ),
                          Text(
                            'Own Dream House',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 70, 66, 66),
                              fontSize: titleSize,
                            ),
                          ),
                          SizedBox(height: gapS),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nDiam maecenas mi non sed ut odio. Non, justo, sed facilisi\net. Eget viverra urna, vestibulum egestas faucibus\negestas. Sagittis nam velit volutpat eu nunc.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: descSize,
                            ),
                          ),
                          SizedBox(height: gapL),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: buttonHeight,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 163, 235),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: buttonFontSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: buttonHeight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const A02PageUi(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 241, 241, 241),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 88, 87, 87),
                                        fontWeight: FontWeight.bold,
                                        fontSize: buttonFontSize,
                                      ),
                                    ),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
