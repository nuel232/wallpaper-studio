import 'package:flutter/material.dart';
import 'package:wallpaper_studio/components/category_cart.dart';
import 'package:wallpaper_studio/models/category.dart';
import 'package:wallpaper_studio/pages/category_detail_screen.dart';
import 'package:wallpaper_studio/pages/setup_screen.dart';

class HomeScreen extends StatelessWidget {
  final String? activeWallpaper;
  final String? activeCategory;
  final Function(String, String) onWallpaperSet;

  const HomeScreen({
    Key? key,
    this.activeWallpaper,
    this.activeCategory,
    required this.onWallpaperSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEC0C43),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.diamond, color: Colors.white, size: 20),
          ),
        ),
        title: const Text(
          'Wallpaper Studio',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (activeWallpaper != null) ...[
                _buildActiveWallpaperCard(context),
                const SizedBox(height: 24),
              ],
              _buildHeroSection(),
              const SizedBox(height: 32),
              _buildCategoriesSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildDrawerItem(context, Icons.home, 'Home', true),
            _buildDrawerItem(context, Icons.grid_view, 'Browse', false),
            _buildDrawerItem(
              context,
              Icons.favorite_border,
              'Favourites',
              false,
            ),
            _buildDrawerItem(context, Icons.settings, 'Settings', false),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF8F8F8) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: isActive ? Colors.black : Colors.grey[600]),
        title: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey[600],
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            fontSize: 16,
          ),
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildActiveWallpaperCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    children: [
                      TextSpan(
                        text: 'Your Active ',
                        style: TextStyle(color: Color(0xFFFBB03B)),
                      ),
                      TextSpan(
                        text: 'Wallpaper',
                        style: TextStyle(color: Color(0xFFEC0C43)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'This wallpaper is currently set as your active background',
                  style: TextStyle(color: Colors.grey[600], fontSize: 11),
                ),
                const SizedBox(height: 10),
                Text(
                  'Category - ${activeCategory ?? 'Nature'}',
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                Text(
                  'Selection - ${activeWallpaper ?? 'Wallpaper 5'}',
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined, size: 20),
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SetupScreen()),
                    );
                  },
                  icon: const Icon(Icons.settings_outlined, size: 20),
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              height: 1.2,
            ),
            children: [
              TextSpan(
                text: 'Discover ',
                style: TextStyle(color: Color(0xFFFBB03B)),
              ),
              TextSpan(
                text: 'Beautiful ',
                style: TextStyle(color: Color(0xFFFFA821)),
              ),
              TextSpan(
                text: 'Wallpapers',
                style: TextStyle(color: Color(0xFFEC0C43)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Discover curated collections of stunning wallpapers. Browse by category, preview in full-screen, and set your favorites.',
          style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CategoryCard(
                category: category,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryDetailScreen(
                        category: category,
                        onWallpaperSet: onWallpaperSet,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
