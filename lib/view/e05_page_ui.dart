import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/view/e06_page_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class E05PageUi extends StatefulWidget {
  const E05PageUi({super.key});

  @override
  State<E05PageUi> createState() => _E05PageUiState();
}

class _E05PageUiState extends State<E05PageUi> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (final controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
            final minScale = math.min(widthScale, heightScale);
            final isTablet = width >= 600;
            final isLargeScreen = width >= 900;
            final scale = minScale.clamp(0.85, 1.8).toDouble();
            final topPadding =
                ((height * 0.05) * scale).clamp(22.0, 44.0).toDouble();
            final contentMaxWidth =
                isLargeScreen ? 680.0 : (isTablet ? 560.0 : width);
            final horizontalPadding = (22.0 * scale).clamp(20.0, 40.0);
            final innerInset = isTablet ? 12.0 : 6.0;
            final headerIconSize = (35 * scale).clamp(32.0, 42.0).toDouble();
            final headerFontSize = (22 * scale).clamp(20.0, 28.0).toDouble();
            final imageHeight = (height * 0.34).clamp(190.0, 340.0).toDouble();
            final sectionTitleSize = (20 * scale).clamp(18.0, 24.0).toDouble();
            final bodyFontSize = (13 * scale).clamp(12.0, 15.0).toDouble();
            final buttonHeight = (52 * scale).clamp(50.0, 58.0).toDouble();
            final buttonFontSize = (20 * scale).clamp(18.0, 24.0).toDouble();

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: contentMaxWidth),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        topPadding,
                        horizontalPadding,
                        16 * scale,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: headerIconSize,
                                  height: headerIconSize,
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
                              Expanded(
                                child: Text(
                                  'OTP Verification',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: headerFontSize,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromARGB(255, 17, 17, 17),
                                  ),
                                ),
                              ),
                              SizedBox(width: headerIconSize),
                            ],
                          ),
                          SizedBox(height: (height * 0.05).clamp(28.0, 52.0)),
                          Center(
                            child: Image.asset(
                              'assets/images/6322675 1.png',
                              height: imageHeight,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: (height * 0.03).clamp(20.0, 32.0)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: innerInset * scale),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Enter OTP',
                                  style: GoogleFonts.poppins(
                                    fontSize: sectionTitleSize,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(255, 17, 17, 17),
                                  ),
                                ),
                                SizedBox(height: 3 * scale),
                                Text(
                                  'An 4 digit code has been sent to your\nemail',
                                  style: GoogleFonts.poppins(
                                    fontSize: bodyFontSize,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 92, 92, 92),
                                  ),
                                ),
                                SizedBox(height: 14 * scale),
                                LayoutBuilder(
                                  builder: (context, otpConstraints) {
                                    final spacing = 6 * scale;
                                    final otpSize = ((otpConstraints.maxWidth -
                                                (spacing * 3)) /
                                            4)
                                        .clamp(44.0, 58.0)
                                        .toDouble();

                                    return Row(
                                      children: List.generate(
                                        4,
                                        (index) => Padding(
                                          padding: EdgeInsets.only(
                                              right: index == 3 ? 0 : spacing),
                                          child: SizedBox(
                                            width: otpSize,
                                            height: otpSize,
                                            child: TextField(
                                              controller:
                                                  _otpControllers[index],
                                              keyboardType:
                                                  TextInputType.number,
                                              maxLength: 1,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: (12 * scale)
                                                    .clamp(12.0, 16.0),
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 30, 35, 44),
                                              ),
                                              decoration: InputDecoration(
                                                counterText: '',
                                                filled: true,
                                                fillColor: const Color.fromARGB(
                                                    255, 217, 217, 217),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 247, 149, 21),
                                                    width: 1.2,
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
                                SizedBox(height: 18 * scale),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'You should recieve the OTP in ',
                                      style: GoogleFonts.poppins(
                                        fontSize: bodyFontSize,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 92, 92, 92),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '30 Second',
                                          style: GoogleFonts.poppins(
                                            fontSize: bodyFontSize,
                                            color: const Color.fromARGB(
                                                255, 247, 149, 21),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 18 * scale),
                                SizedBox(
                                  width: double.infinity,
                                  height: buttonHeight,
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
                                                const E06PageUi(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: Text(
                                        'Verify',
                                        style: GoogleFonts.poppins(
                                          fontSize: buttonFontSize,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20 * scale),
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
