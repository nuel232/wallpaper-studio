// Main Navigation Screen with Bottom Nav
import 'package:flutter/material.dart';
import 'package:wallpaper_studio/pages/browser_screen.dart';
import 'package:wallpaper_studio/pages/favorites_screen.dart';
import 'package:wallpaper_studio/pages/home/home_screen.dart';
import 'package:wallpaper_studio/pages/settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  String? _activeWallpaper;
  String? _activeCategory;
  final List<Wallpaper> _favorites = [];

  void _setActiveWallpaper(String wallpaper, String category) {
    setState(() {
      _activeWallpaper = wallpaper;
      _activeCategory = category;
    });
  }

  void _toggleFavorite(Wallpaper wallpaper) {
    setState(() {
      if (_favorites.any((w) => w.id == wallpaper.id)) {
        _favorites.removeWhere((w) => w.id == wallpaper.id);
      } else {
        _favorites.add(wallpaper);
      }
    });
  }

  bool _isFavorite(Wallpaper wallpaper) {
    return _favorites.any((w) => w.id == wallpaper.id);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(
        activeWallpaper: _activeWallpaper,
        activeCategory: _activeCategory,
        onWallpaperSet: _setActiveWallpaper,
      ),
      BrowserScreen(
        onWallpaperSet: _setActiveWallpaper,
        favorites: _favorites,
        onToggleFavorite: _toggleFavorite,
        isFavorite: _isFavorite,
      ),
      FavoritesScreen(
        favorites: _favorites,
        onWallpaperSet: _setActiveWallpaper,
        onToggleFavorite: _toggleFavorite,
        isFavorite: _isFavorite,
      ),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, 'Home', 0),
              _buildNavItem(Icons.grid_view_outlined, 'Browse', 1),
              _buildNavItem(Icons.favorite_border, 'Favourites', 2),
              _buildNavItem(Icons.settings_outlined, 'Settings', 3),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildNavItem(IconData icon, String label, int index) {
  final isActive = _currentIndex == index;
  return InkWell(
    onTap: () => setState(() => _currentIndex = index),
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFFBB03B).withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFFFBB03B) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFFFBB03B) : Colors.grey,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}
