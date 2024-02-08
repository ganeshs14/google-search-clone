import 'package:flutter/material.dart';
import 'package:google_search_clone/colors.dart';
import 'package:google_search_clone/responsive/mobile_screen_layout.dart';
import 'package:google_search_clone/responsive/responsive_layout_screen.dart';
import 'package:google_search_clone/responsive/web_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ResponsiveLayoutScreen(mobileScreenLayout: MobileScreenLayout(), webScreenLayout: WebScreenLayout()),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
    );
  }
}