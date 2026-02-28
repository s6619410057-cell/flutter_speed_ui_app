import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/view/home_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlutterSpeedUiApp());
}

class FlutterSpeedUiApp extends StatelessWidget {
  const FlutterSpeedUiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const HomeUi(),
    );
  }
}
