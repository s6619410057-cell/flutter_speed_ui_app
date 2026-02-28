import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'b02_page_ui.dart';

class B03PageUi extends StatelessWidget {
  const B03PageUi({super.key});

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
            final minScale =
                widthScale < heightScale ? widthScale : heightScale;
            final safeScale = minScale.clamp(0.85, 1.8);
            final isCompactHeight = h < 700;
            final contentWidth = w;

            final horizontalPadding = (16.0 * safeScale).clamp(14.0, 36.0);
            final titleSize = (30.0 * safeScale).clamp(28.0, 44.0);
            final subtitleSize = (14.0 * safeScale).clamp(14.0, 18.0);
            final fieldPadding = (22.0 * safeScale).clamp(20.0, 24.0);
            final buttonHeight = (62.0 * safeScale).clamp(58.0, 70.0);
            final buttonFontSize = (18.0 * safeScale).clamp(17.0, 22.0);
            final topGap = (82.0 * safeScale).clamp(76.0, 120.0);
            final socialBoxWidth = (55.0 * safeScale).clamp(52.0, 64.0);
            final socialBoxHeight = (40.0 * safeScale).clamp(38.0, 46.0);

            return Stack(
              children: [
                Positioned(
                  top: -(w * 0.56),
                  right: -(w * 0.52),
                  child: Container(
                    width: w * 1.05,
                    height: w * 1.05,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 239, 246, 255),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: -(w * 0.30),
                  right: -(w * 0.18),
                  child: Container(
                    width: w * 0.80,
                    height: w * 0.80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 239, 246, 255),
                        width: 4,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: h),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: contentWidth,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                            vertical: (12.0 * safeScale).clamp(10.0, 20.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: topGap),
                              Text(
                                'Create Account',
                                style: GoogleFonts.poppins(
                                  fontSize: titleSize,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 31, 59, 184),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: (16.0 * safeScale).clamp(14.0, 22.0),
                              ),
                              Text(
                                'Create an account so you can explore all the\nexisting jobs',
                                style: GoogleFonts.poppins(
                                  fontSize: subtitleSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  height: 1.35,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: (34.0 * safeScale).clamp(26.0, 44.0),
                              ),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 244, 246, 255),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: fieldPadding,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: (22.0 * safeScale).clamp(18.0, 28.0),
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 244, 246, 255),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: fieldPadding,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: (22.0 * safeScale).clamp(18.0, 28.0),
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm password',
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 244, 246, 255),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: fieldPadding,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: isCompactHeight
                                    ? (26.0 * safeScale).clamp(22.0, 34.0)
                                    : (40.0 * safeScale).clamp(30.0, 52.0),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: buttonHeight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 31, 59, 184),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign up',
                                    style: GoogleFonts.poppins(
                                      fontSize: buttonFontSize,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: (14.0 * safeScale).clamp(12.0, 20.0),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const B02PageUi(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Already have an account',
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 68, 68, 68),
                                    fontSize:
                                        (14.0 * safeScale).clamp(14.0, 16.0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: isCompactHeight
                                    ? (24.0 * safeScale).clamp(20.0, 32.0)
                                    : (50.0 * safeScale).clamp(36.0, 64.0),
                              ),
                              Text(
                                'Or continue with',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 31, 59, 184),
                                  fontSize:
                                      (14.0 * safeScale).clamp(14.0, 16.0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: (16.0 * safeScale).clamp(14.0, 22.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      width: socialBoxWidth,
                                      height: socialBoxHeight,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 245, 245, 245),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'G',
                                          style: GoogleFonts.googleSans(
                                            color: Colors.black,
                                            fontSize: (22.0 * safeScale)
                                                .clamp(22.0, 23.0),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (12.0 * safeScale).clamp(10.0, 18.0),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      width: socialBoxWidth,
                                      height: socialBoxHeight,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 245, 245, 245),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.facebook,
                                        color: Colors.black,
                                        size: (24.0 * safeScale)
                                            .clamp(22.0, 30.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (12.0 * safeScale).clamp(10.0, 18.0),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      width: socialBoxWidth,
                                      height: socialBoxHeight,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 245, 245, 245),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.apple,
                                        color: Colors.black,
                                        size: (24.0 * safeScale)
                                            .clamp(22.0, 30.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: isCompactHeight
                                    ? (14.0 * safeScale).clamp(12.0, 20.0)
                                    : (24.0 * safeScale).clamp(18.0, 34.0),
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
      ),
    );
  }
}
