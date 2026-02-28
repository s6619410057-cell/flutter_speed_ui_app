import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'd07_page_ui.dart';

class D06PageUi extends StatefulWidget {
  const D06PageUi({super.key});

  @override
  State<D06PageUi> createState() => _D06PageUiState();
}

class _D06PageUiState extends State<D06PageUi> {
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
                    child: Align(
                      alignment: Alignment.topCenter,
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
                                      final now =
                                          snapshot.data ?? DateTime.now();
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
                                  color:
                                      const Color.fromARGB(255, 237, 237, 237),
                                  borderRadius: BorderRadius.circular(
                                    (10.0 * safeScale).clamp(9.0, 16.0),
                                  ),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 218, 218, 218),
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
                                  height: (44.0 * safeScale).clamp(34.0, 62.0)),
                              Text(
                                'Create new password',
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      (30.0 * safeScale).clamp(26.0, 40.0),
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 36, 40, 51),
                                ),
                              ),
                              SizedBox(
                                  height: (12.0 * safeScale).clamp(10.0, 18.0)),
                              Text(
                                'Your new password must be unique from those\npreviously used.',
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      (14.0 * safeScale).clamp(13.0, 19.0),
                                  color:
                                      const Color.fromARGB(255, 124, 140, 162),
                                ),
                              ),
                              SizedBox(
                                  height: (34.0 * safeScale).clamp(28.0, 48.0)),
                              _inputField('New Password', safeScale),
                              SizedBox(
                                  height: (16.0 * safeScale).clamp(12.0, 24.0)),
                              _inputField('Confirm Password', safeScale),
                              SizedBox(
                                  height: (38.0 * safeScale).clamp(30.0, 54.0)),
                              SizedBox(
                                width: double.infinity,
                                height: (56.0 * safeScale).clamp(52.0, 72.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const D07PageUi(),
                                      ),
                                    );
                                  },
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
                                    'Reset Password',
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
                                  height: (24.0 * safeScale).clamp(20.0, 34.0)),
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

  Widget _inputField(String hint, double safeScale) {
    return TextField(
      obscureText: true,
      style: GoogleFonts.poppins(
        color: const Color.fromARGB(255, 36, 40, 51),
        fontSize: (15.0 * safeScale).clamp(14.0, 20.0),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 124, 140, 162),
          fontSize: (15.0 * safeScale).clamp(14.0, 20.0),
        ),
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
}
