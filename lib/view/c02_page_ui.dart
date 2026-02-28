import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/view/c03_page_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class C02PageUi extends StatefulWidget {
  const C02PageUi({super.key});

  @override
  State<C02PageUi> createState() => _C02PageUiState();
}

class _C02PageUiState extends State<C02PageUi> {
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

            final isLargeScreen = width >= 700;
            final contentMaxWidth = isLargeScreen ? 560.0 : width;
            final horizontalPadding = (34.0 * safeScale).clamp(24.0, 44.0);
            final topGap = ((height * 0.03) * safeScale).clamp(14.0, 34.0);
            final logoGap = ((height * 0.045) * safeScale).clamp(20.0, 40.0);
            final sectionGap = ((height * 0.025) * safeScale).clamp(14.0, 28.0);
            final bottomGap = ((height * 0.04) * safeScale).clamp(20.0, 40.0);
            final socialBoxHeight =
                ((width * 0.11) * safeScale).clamp(32.0, 52.0);
            final socialBoxWidth = ((contentMaxWidth * 0.16) * safeScale).clamp(
              54.0,
              88.0,
            );

            final titleSize = (27.0 * safeScale).clamp(24.0, 34.0);
            final labelSize = (16.0 * safeScale).clamp(14.0, 20.0);
            final inputSize = (15.0 * safeScale).clamp(13.0, 18.0);
            final buttonSize = (15.0 * safeScale).clamp(14.0, 18.0);

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
                            horizontal: horizontalPadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: topGap),
                              Row(
                                children: [
                                  StreamBuilder<DateTime>(
                                    stream: Stream.periodic(
                                      const Duration(seconds: 1),
                                      (_) => DateTime.now(),
                                    ),
                                    initialData: DateTime.now(),
                                    builder: (context, snapshot) {
                                      final now =
                                          snapshot.data ?? DateTime.now();
                                      final hh =
                                          now.hour.toString().padLeft(2, '0');
                                      final mm =
                                          now.minute.toString().padLeft(2, '0');
                                      return Text(
                                        '$hh:$mm',
                                        style: GoogleFonts.poppins(
                                          fontSize: (14.0 * safeScale)
                                              .clamp(13.0, 18.0),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      );
                                    },
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.signal_cellular_alt,
                                    size: (18.0 * safeScale).clamp(16.0, 24.0),
                                  ),
                                  SizedBox(
                                    width: (5.0 * safeScale).clamp(4.0, 8.0),
                                  ),
                                  Icon(
                                    Icons.wifi,
                                    size: (18.0 * safeScale).clamp(16.0, 24.0),
                                  ),
                                  SizedBox(
                                    width: (5.0 * safeScale).clamp(4.0, 8.0),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.batteryEmpty,
                                    size: (18.0 * safeScale).clamp(16.0, 24.0),
                                  ),
                                ],
                              ),
                              SizedBox(height: logoGap),
                              Center(
                                child: Container(
                                  width: (50.0 * safeScale).clamp(44.0, 70.0),
                                  height: (50.0 * safeScale).clamp(44.0, 70.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      (10.0 * safeScale).clamp(8.0, 14.0),
                                    ),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 52, 167, 81),
                                      width: (3.0 * safeScale).clamp(2.5, 4.0),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/images/vector.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: sectionGap),
                              Text(
                                'Sign in your account',
                                style: GoogleFonts.poppins(
                                  fontSize: titleSize,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              SizedBox(height: sectionGap),
                              Text(
                                'Email',
                                style: GoogleFonts.poppins(
                                  fontSize: labelSize,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126),
                                ),
                              ),
                              SizedBox(
                                  height: (10.0 * safeScale).clamp(8.0, 14.0)),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      (10.0 * safeScale).clamp(8.0, 14.0),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical:
                                        (10.0 * safeScale).clamp(8.0, 14.0),
                                    horizontal:
                                        (10.0 * safeScale).clamp(10.0, 14.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 250, 250, 250),
                                  hintText: 'ex:jon.smith@gmail.com',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: inputSize,
                                    fontWeight: FontWeight.normal,
                                    color: const Color.fromARGB(
                                        255, 136, 136, 136),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: (15.0 * safeScale).clamp(12.0, 20.0)),
                              Text(
                                'Password',
                                style: GoogleFonts.poppins(
                                  fontSize: labelSize,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126),
                                ),
                              ),
                              SizedBox(
                                  height: (10.0 * safeScale).clamp(8.0, 14.0)),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      (10.0 * safeScale).clamp(8.0, 14.0),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical:
                                        (10.0 * safeScale).clamp(8.0, 14.0),
                                    horizontal:
                                        (10.0 * safeScale).clamp(10.0, 14.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 250, 250, 250),
                                  hintText: '*******',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: inputSize,
                                    fontWeight: FontWeight.normal,
                                    color: const Color.fromARGB(
                                        255, 136, 136, 136),
                                  ),
                                ),
                              ),
                              SizedBox(height: sectionGap),
                              SizedBox(
                                width: double.infinity,
                                height: (45.0 * safeScale).clamp(42.0, 56.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        (10.0 * safeScale).clamp(8.0, 14.0),
                                      ),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 0, 177, 64),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'SIGN IN',
                                    style: GoogleFonts.poppins(
                                      fontSize: buttonSize,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: sectionGap),
                              Center(
                                child: Text(
                                  'Or sign in with',
                                  style: GoogleFonts.poppins(
                                    fontSize: labelSize,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(
                                        255, 136, 136, 136),
                                  ),
                                ),
                              ),
                              SizedBox(height: sectionGap),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _socialBox(
                                    width: socialBoxWidth,
                                    height: socialBoxHeight,
                                    child: Image.asset(
                                      'assets/images/Google logo.png',
                                      fit: BoxFit.contain,
                                      width:
                                          (30.0 * safeScale).clamp(24.0, 38.0),
                                      height:
                                          (30.0 * safeScale).clamp(24.0, 38.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: ((width * 0.05) * safeScale)
                                        .clamp(12.0, 24.0),
                                  ),
                                  _socialBox(
                                    width: socialBoxWidth,
                                    height: socialBoxHeight,
                                    child: FaIcon(
                                      FontAwesomeIcons.facebookF,
                                      size:
                                          (24.0 * safeScale).clamp(20.0, 30.0),
                                      color: const Color.fromARGB(
                                          255, 24, 119, 242),
                                    ),
                                  ),
                                  SizedBox(
                                    width: ((width * 0.05) * safeScale)
                                        .clamp(12.0, 24.0),
                                  ),
                                  _socialBox(
                                    width: socialBoxWidth,
                                    height: socialBoxHeight,
                                    child: FaIcon(
                                      FontAwesomeIcons.twitter,
                                      size:
                                          (22.0 * safeScale).clamp(19.0, 28.0),
                                      color: const Color.fromARGB(
                                          255, 29, 161, 242),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: sectionGap),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account? ',
                                    style: GoogleFonts.poppins(
                                      fontSize:
                                          (14.0 * safeScale).clamp(13.0, 18.0),
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromARGB(
                                          255, 136, 136, 136),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const C03PageUi(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      'SIGN UP',
                                      style: GoogleFonts.poppins(
                                        fontSize: (14.0 * safeScale)
                                            .clamp(13.0, 18.0),
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(
                                            255, 0, 177, 64),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: bottomGap),
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

  Widget _socialBox({
    required double width,
    required double height,
    required Widget child,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 244, 244),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}
