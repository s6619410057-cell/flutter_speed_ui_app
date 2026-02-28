import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'd02_page_ui.dart';

class D03PageUi extends StatefulWidget {
  const D03PageUi({super.key});

  @override
  State<D03PageUi> createState() => _D03PageUiState();
}

class _D03PageUiState extends State<D03PageUi> {
  bool _isPasswordHidden = true;
  bool _isConfirmHidden = true;

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

            final isLargeScreen = width >= 700;
            final contentMaxWidth = isLargeScreen ? 560.0 : width;
            final footerGap = ((height * 0.1) * safeScale).clamp(40.0, 110.0);

            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: width,
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: contentMaxWidth),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: (20.0 * safeScale).clamp(18.0, 30.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: (8.0 * safeScale).clamp(8.0, 14.0)),
                            Row(
                              children: [
                                StreamBuilder<DateTime>(
                                  stream: Stream.periodic(
                                    const Duration(seconds: 1),
                                    (_) => DateTime.now(),
                                  ),
                                  initialData: DateTime.now(),
                                  builder: (context, snapshot) {
                                    final now = snapshot.data ?? DateTime.now();
                                    final hh =
                                        now.hour.toString().padLeft(2, '0');
                                    final mm =
                                        now.minute.toString().padLeft(2, '0');
                                    return Text(
                                      '$hh:$mm',
                                      style: GoogleFonts.poppins(
                                        fontSize: (16.0 * safeScale)
                                            .clamp(14.0, 21.0),
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 17, 24, 39),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.signal_cellular_alt,
                                  size: (17.0 * safeScale).clamp(15.0, 24.0),
                                ),
                                SizedBox(
                                    width: (4.0 * safeScale).clamp(4.0, 8.0)),
                                Icon(
                                  Icons.wifi,
                                  size: (17.0 * safeScale).clamp(15.0, 24.0),
                                ),
                                SizedBox(
                                    width: (4.0 * safeScale).clamp(4.0, 8.0)),
                                FaIcon(
                                  FontAwesomeIcons.batteryThreeQuarters,
                                  size: (16.0 * safeScale).clamp(14.0, 22.0),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: (22.0 * safeScale).clamp(20.0, 34.0)),
                            Container(
                              width: (36.0 * safeScale).clamp(34.0, 52.0),
                              height: (36.0 * safeScale).clamp(34.0, 52.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 237, 237, 237),
                                borderRadius: BorderRadius.circular(
                                  (10.0 * safeScale).clamp(9.0, 16.0),
                                ),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 218, 218, 218),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: (16.0 * safeScale).clamp(14.0, 20.0),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: (30.0 * safeScale).clamp(26.0, 44.0)),
                            Text(
                              'Hello! Register to get\nstarted',
                              style: GoogleFonts.poppins(
                                fontSize: (30.0 * safeScale).clamp(26.0, 40.0),
                                fontWeight: FontWeight.w700,
                                height: 1.15,
                                color: const Color.fromARGB(255, 36, 40, 51),
                              ),
                            ),
                            SizedBox(
                                height: (30.0 * safeScale).clamp(24.0, 42.0)),
                            _inputField('Username', safeScale),
                            SizedBox(
                                height: (12.0 * safeScale).clamp(10.0, 18.0)),
                            _inputField('Email', safeScale),
                            SizedBox(
                                height: (12.0 * safeScale).clamp(10.0, 18.0)),
                            _inputField(
                              'Password',
                              safeScale,
                              obscureText: _isPasswordHidden,
                              suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordHidden = !_isPasswordHidden;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordHidden
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color:
                                      const Color.fromARGB(255, 112, 122, 138),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: (12.0 * safeScale).clamp(10.0, 18.0)),
                            _inputField(
                              'Confirm password',
                              safeScale,
                              obscureText: _isConfirmHidden,
                              suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isConfirmHidden = !_isConfirmHidden;
                                  });
                                },
                                icon: Icon(
                                  _isConfirmHidden
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color:
                                      const Color.fromARGB(255, 112, 122, 138),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: (30.0 * safeScale).clamp(24.0, 42.0)),
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
                                  'Register',
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
                                height: (30.0 * safeScale).clamp(24.0, 42.0)),
                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                      color:
                                          Color.fromARGB(255, 213, 217, 225)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        (12.0 * safeScale).clamp(10.0, 18.0),
                                  ),
                                  child: Text(
                                    'Or Register with',
                                    style: GoogleFonts.poppins(
                                      fontSize:
                                          (14.0 * safeScale).clamp(13.0, 19.0),
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 95, 107, 125),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                      color:
                                          Color.fromARGB(255, 213, 217, 225)),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: (20.0 * safeScale).clamp(16.0, 30.0)),
                            Row(
                              children: [
                                Expanded(
                                  child: _socialBox(
                                    safeScale,
                                    child: FaIcon(
                                      FontAwesomeIcons.facebookF,
                                      size:
                                          (30.0 * safeScale).clamp(24.0, 40.0),
                                      color: const Color.fromARGB(
                                          255, 47, 128, 237),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: (10.0 * safeScale).clamp(8.0, 16.0)),
                                Expanded(
                                  child: _socialBox(
                                    safeScale,
                                    child: Image.asset(
                                      'assets/images/Google logo.png',
                                      width:
                                          (31.0 * safeScale).clamp(24.0, 40.0),
                                      height:
                                          (31.0 * safeScale).clamp(24.0, 40.0),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: (10.0 * safeScale).clamp(8.0, 16.0)),
                                Expanded(
                                  child: _socialBox(
                                    safeScale,
                                    child: FaIcon(
                                      FontAwesomeIcons.apple,
                                      size:
                                          (33.0 * safeScale).clamp(26.0, 42.0),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: footerGap),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        (15.0 * safeScale).clamp(14.0, 20.0),
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 36, 40, 51),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const D02PageUi(),
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
                                    'Login Now',
                                    style: GoogleFonts.poppins(
                                      fontSize:
                                          (15.0 * safeScale).clamp(14.0, 20.0),
                                      color: const Color.fromARGB(
                                          255, 28, 202, 216),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: (24.0 * safeScale).clamp(20.0, 34.0)),
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

  Widget _inputField(
    String hint,
    double safeScale, {
    Widget? suffix,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 124, 140, 162),
          fontSize: (16.0 * safeScale).clamp(14.0, 21.0),
        ),
        suffixIcon: suffix,
        filled: true,
        fillColor: const Color.fromARGB(255, 233, 235, 239),
        contentPadding: EdgeInsets.symmetric(
          horizontal: (18.0 * safeScale).clamp(16.0, 26.0),
          vertical: (20.0 * safeScale).clamp(18.0, 30.0),
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular((10.0 * safeScale).clamp(9.0, 16.0)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _socialBox(double safeScale, {required Widget child}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular((10.0 * safeScale).clamp(9.0, 16.0)),
      child: Container(
        height: (62.0 * safeScale).clamp(56.0, 80.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 237, 239, 242),
          borderRadius:
              BorderRadius.circular((10.0 * safeScale).clamp(9.0, 16.0)),
          border: Border.all(color: const Color.fromARGB(255, 217, 220, 227)),
        ),
        child: Center(child: child),
      ),
    );
  }
}
