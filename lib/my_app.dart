import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: _buildTheme(Brightness.light),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }

  ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness, useMaterial3: true,);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}
}
