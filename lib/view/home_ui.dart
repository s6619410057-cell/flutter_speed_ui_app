import 'package:flutter/material.dart';
import 'a01_page_ui.dart';
import 'b01_page_ui.dart';
import 'c01_page_ui.dart';
import 'd01_page_ui.dart';
import 'e01_page_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});
  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  Widget _menuButton({
    required BuildContext context,
    required double width,
    required double height,
    required double fontSize,
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            final horizontalPadding = 16.0 * safeScale;
            final imageSize = (188.0 * safeScale).clamp(150.0, 340.0);
            final buttonWidth = contentWidth - (horizontalPadding * 2);
            final buttonHeight = (52.0 * safeScale).clamp(44.0, 70.0);
            final fontSize = (14.0 * safeScale).clamp(12.0, 20.0);
            final gap = (12.0 * safeScale).clamp(10.0, 24.0);

            return Container(
              color: const Color.fromARGB(255, 54, 6, 87),
              child: SingleChildScrollView(
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
                          vertical: (20.0 * safeScale).clamp(12.0, 28.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: gap),
                            Image.asset(
                              'assets/images/imgg2 1.png',
                              width: imageSize,
                              height: imageSize,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: imageSize,
                                  height: imageSize,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.image,
                                    size: imageSize * 0.4,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: gap),
                            _menuButton(
                              context: context,
                              width: buttonWidth.toDouble(),
                              height: buttonHeight,
                              fontSize: fontSize,
                              title: 'Go to A Page',
                              color: const Color.fromARGB(255, 255, 163, 235),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const A01PageUi(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: gap),
                            _menuButton(
                              context: context,
                              width: buttonWidth.toDouble(),
                              height: buttonHeight,
                              fontSize: fontSize,
                              title: 'Go to B Page',
                              color: const Color.fromARGB(255, 31, 59, 184),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const B01PageUi(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: gap),
                            _menuButton(
                              context: context,
                              width: buttonWidth.toDouble(),
                              height: buttonHeight,
                              fontSize: fontSize,
                              title: 'Go to C Page',
                              color: const Color.fromARGB(255, 0, 177, 64),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const C01PageUi(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: gap),
                            _menuButton(
                              context: context,
                              width: buttonWidth.toDouble(),
                              height: buttonHeight,
                              fontSize: fontSize,
                              title: 'Go to D Page',
                              color: const Color.fromARGB(255, 40, 183, 194),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const D01PageUi(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: gap),
                            _menuButton(
                              context: context,
                              width: buttonWidth.toDouble(),
                              height: buttonHeight,
                              fontSize: fontSize,
                              title: 'Go to E Page',
                              color: Color.fromARGB(255, 228, 137, 33),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const E01PageUi(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: gap),
                          ],
                        ),
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
