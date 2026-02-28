import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class D07PageUi extends StatefulWidget {
  const D07PageUi({super.key});

  @override
  State<D07PageUi> createState() => _D07PageUiState();
}

class _D07PageUiState extends State<D07PageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
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

            final contentMaxWidth = width >= 700 ? 560.0 : width;

            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: width,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: height),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: contentMaxWidth),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: (24.0 * safeScale).clamp(20.0, 34.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: ((height * 0.2) * safeScale)
                                    .clamp(90.0, 180.0),
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/images/Successmark.png',
                                  width: (100.0 * safeScale).clamp(86.0, 140.0),
                                  height:
                                      (100.0 * safeScale).clamp(86.0, 140.0),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                  height: (40.0 * safeScale).clamp(30.0, 56.0)),
                              Text(
                                'Password Changed!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      (26.0 * safeScale).clamp(22.0, 36.0),
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 36, 40, 51),
                                ),
                              ),
                              SizedBox(
                                  height: (10.0 * safeScale).clamp(8.0, 16.0)),
                              Text(
                                'Your password has been changed\nsuccessfully.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      (15.0 * safeScale).clamp(14.0, 20.0),
                                  color:
                                      const Color.fromARGB(255, 124, 140, 162),
                                ),
                              ),
                              SizedBox(
                                  height: (40.0 * safeScale).clamp(30.0, 56.0)),
                              SizedBox(
                                width: double.infinity,
                                height: (56.0 * safeScale).clamp(52.0, 72.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 27, 34, 50),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        (10.0 * safeScale).clamp(9.0, 16.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Back to Login',
                                    style: GoogleFonts.poppins(
                                      fontSize:
                                          (15.0 * safeScale).clamp(14.0, 20.0),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ((height * 0.16) * safeScale)
                                    .clamp(70.0, 150.0),
                              ),
                            ],
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
      ),
    );
  }
}
