import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_studio/pages/main_navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const WallpaperStudioApp());
}

class WallpaperStudioApp extends StatelessWidget {
  const WallpaperStudioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Studio',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFFFBB03B),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainNavigationScreen(),
    );
  }
}
