import 'package:flutter/material.dart';

void main() {
  runApp(const WallpaperStudioApp());
}

class WallpaperStudioApp extends StatelessWidget {
  const WallpaperStudioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Studio',
      theme: ThemeData(
        primaryColor: const Color(0xFFFBB03B),
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const MainNavigationScreen(),
    );
  }
}
