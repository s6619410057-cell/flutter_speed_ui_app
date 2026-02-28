import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/view/a01_page_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class A02PageUi extends StatefulWidget {
  const A02PageUi({super.key});

  @override
  State<A02PageUi> createState() => _A02PageUiState();
}

class _A02PageUiState extends State<A02PageUi> {
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
            final safeScale = minScale.clamp(0.9, 1.65);
            final horizontalPadding = (20.0 * safeScale).clamp(18.0, 40.0);
            final socialSize = (62.0 * safeScale).clamp(56.0, 86.0);

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<DateTime>(
                            stream: Stream.periodic(
                              const Duration(seconds: 1),
                              (_) => DateTime.now(),
                            ),
                            initialData: DateTime.now(),
                            builder: (context, snapshot) {
                              final now = snapshot.data ?? DateTime.now();
                              final hh = now.hour.toString().padLeft(2, '0');
                              final mm = now.minute.toString().padLeft(2, '0');
                              return Text(
                                '$hh:$mm',
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      (14.0 * safeScale).clamp(13.0, 20.0),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.signal_cellular_4_bar,
                                size: (15.0 * safeScale).clamp(14.0, 20.0),
                              ),
                              SizedBox(width: 4 * safeScale),
                              Icon(
                                Icons.wifi,
                                size: (15.0 * safeScale).clamp(14.0, 20.0),
                              ),
                              SizedBox(width: 4 * safeScale),
                              Icon(
                                Icons.battery_full,
                                size: (15.0 * safeScale).clamp(14.0, 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: (50.0 * safeScale).clamp(44.0, 72.0)),
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.poppins(
                          fontSize: (30.0 * safeScale).clamp(28.0, 44.0),
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF464444),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: (12.0 * safeScale).clamp(10.0, 16.0)),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit. Diam maecenas mi non sed ut odio. Non, justo,\nsed facilisi et.',
                        style: GoogleFonts.poppins(
                          fontSize: (13.0 * safeScale).clamp(12.0, 18.0),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: (30.0 * safeScale).clamp(24.0, 44.0)),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Usename,Email & Phone Number',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 245, 245, 245),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: (22.0 * safeScale).clamp(20.0, 30.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: (10.0 * safeScale).clamp(8.0, 14.0)),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 245, 245, 245),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: (22.0 * safeScale).clamp(20.0, 30.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: (5.0 * safeScale).clamp(4.0, 8.0)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF000000),
                              fontSize: (14.0 * safeScale).clamp(13.0, 18.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: (12.0 * safeScale).clamp(10.0, 16.0)),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const A01PageUi(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF89AEE),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: (22.0 * safeScale).clamp(20.0, 30.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.poppins(
                              fontSize: (18.0 * safeScale).clamp(17.0, 24.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: (30.0 * safeScale).clamp(24.0, 44.0)),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 3,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFF89AEE),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                          ),
                          SizedBox(width: (10.0 * safeScale).clamp(8.0, 14.0)),
                          Text(
                            'Or Sign up With',
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 70, 70, 70),
                              fontSize: (14.0 * safeScale).clamp(13.0, 18.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: (10.0 * safeScale).clamp(8.0, 14.0)),
                          Expanded(
                            child: Container(
                              height: 3,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFF89AEE),
                                    Color(0xFFFFFFFF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: (20.0 * safeScale).clamp(16.0, 30.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialCircle(
                            size: socialSize,
                            child: Image.asset(
                              'assets/images/Google logo.png',
                              width: (30.0 * safeScale).clamp(28.0, 42.0),
                              height: (30.0 * safeScale).clamp(28.0, 42.0),
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: (16.0 * safeScale).clamp(14.0, 24.0)),
                          _socialCircle(
                            size: socialSize,
                            child: Container(
                              width: (34.0 * safeScale).clamp(31.0, 46.0),
                              height: (34.0 * safeScale).clamp(31.0, 46.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFF1877F2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.facebookF,
                                  size: (18.0 * safeScale).clamp(17.0, 24.0),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: (16.0 * safeScale).clamp(14.0, 24.0)),
                          _socialCircle(
                            size: socialSize,
                            child: FaIcon(
                              FontAwesomeIcons.apple,
                              size: (30.0 * safeScale).clamp(28.0, 42.0),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: (20.0 * safeScale).clamp(16.0, 30.0)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _socialCircle({required double size, required Widget child}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(99),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 238, 238),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color.fromARGB(255, 237, 174, 229),
            width: 1.5,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
