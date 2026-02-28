import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class E06PageUi extends StatelessWidget {
  const E06PageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: SafeArea(
        top: false,
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
            final scale = minScale.clamp(0.85, 1.8).toDouble();
            final contentMaxWidth =
                isLargeScreen ? 520.0 : (isTablet ? 480.0 : width);
            final horizontalPadding = (28.0 * scale).clamp(22.0, 34.0);
            final headerImageHeight =
                ((width * (313 / 360)) * scale).toDouble();
            final headerSectionHeight =
                ((height * 0.42) * scale).clamp(250.0, 430.0).toDouble();
            final titleTopSpace =
                ((height * 0.022) * scale).clamp(10.0, 20.0).toDouble();
            final fieldHeight = (50 * scale).clamp(48.0, 56.0).toDouble();
            final buttonHeight = (52 * scale).clamp(50.0, 58.0).toDouble();
            const headerTopGap = 0.0;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height),
                child: Column(
                  children: [
                    SizedBox(
                      height: headerSectionHeight,
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          Positioned(
                            top: headerTopGap,
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
                            top:
                                (statusBarTop + (14 * scale)).clamp(20.0, 52.0),
                            left: 18 * scale,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: (34 * scale).clamp(32.0, 38.0),
                                height: (34 * scale).clamp(32.0, 38.0),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 252, 242, 204),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: (17 * scale).clamp(14.0, 18.0),
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
                              SizedBox(height: titleTopSpace),
                              Text(
                                'Create New Password',
                                style: GoogleFonts.poppins(
                                  fontSize: (20 * scale).clamp(20.0, 24.0),
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 17, 17, 17),
                                ),
                              ),
                              SizedBox(height: 2 * scale),
                              Text(
                                'Enter new password',
                                style: GoogleFonts.poppins(
                                  fontSize: (15 * scale).clamp(15.0, 17.0),
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 32, 32, 32),
                                ),
                              ),
                              SizedBox(height: 20 * scale),
                              SizedBox(
                                height: fieldHeight,
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Enter New password',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: (12 * scale).clamp(12.0, 14.0),
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 154, 154, 154),
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 242, 242, 242),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 14 * scale,
                                      vertical: 12 * scale,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 243, 177, 0),
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 243, 177, 0),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10 * scale),
                              SizedBox(
                                height: fieldHeight,
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm password',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: (12 * scale).clamp(12.0, 14.0),
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 154, 154, 154),
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 242, 242, 242),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 14 * scale,
                                      vertical: 12 * scale,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 155, 155, 155),
                                        width: 1.2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 243, 177, 0),
                                        width: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: (24 * scale).clamp(22.0, 30.0)),
                              SizedBox(
                                width: double.infinity,
                                height: buttonHeight,
                                child: DecoratedBox(
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
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      'Submit',
                                      style: GoogleFonts.poppins(
                                        fontSize:
                                            (20 * scale).clamp(18.0, 24.0),
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: (26 * scale).clamp(24.0, 34.0)),
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
