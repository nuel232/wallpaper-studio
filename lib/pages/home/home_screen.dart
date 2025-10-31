import 'package:flutter/material.dart';

// Home Screen
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
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Scaffold(
      appBar: _buildAppBar(context, isDesktop),
      drawer: isDesktop ? null : _buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isDesktop ? 40 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (activeWallpaper != null) ...[
                _buildActiveWallpaperCard(context, isDesktop),
                const SizedBox(height: 32),
              ],
              _buildHeroSection(isDesktop),
              const SizedBox(height: 40),
              _buildCategoriesSection(context, isDesktop),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDesktop) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: isDesktop
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/logo.png',
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.diamond, color: Color(0xFFEC0C43)),
              ),
            )
          : null,
      title: Row(
        children: [
          if (!isDesktop)
            const Icon(Icons.diamond, color: Color(0xFFEC0C43), size: 20),
          if (!isDesktop) const SizedBox(width: 8),
          const Text(
            'Wallpaper Studio',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: isDesktop ? _buildDesktopNavigation(context) : null,
    );
  }

  List<Widget> _buildDesktopNavigation(BuildContext context) {
    return [
      _buildNavButton(Icons.home, 'Home', true),
      _buildNavButton(Icons.grid_view, 'Browse', false),
      _buildNavButton(Icons.favorite_border, 'Favourites', false),
      _buildNavButton(Icons.settings, 'Settings', false),
      const SizedBox(width: 20),
    ];
  }

  Widget _buildNavButton(IconData icon, String label, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 20,
          color: isActive ? Colors.black : Colors.grey,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: isActive
              ? const Color(0xFFF8F8F8)
              : Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Icon(Icons.diamond, color: Color(0xFFEC0C43)),
                SizedBox(width: 12),
                Text(
                  'Wallpaper Studio',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home', true),
          _buildDrawerItem(Icons.grid_view, 'Browse', false),
          _buildDrawerItem(Icons.favorite_border, 'Favourites', false),
          _buildDrawerItem(Icons.settings, 'Settings', false),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String label, bool isActive) {
    return ListTile(
      leading: Icon(icon, color: isActive ? Colors.black : Colors.grey),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.grey,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      onTap: () {},
    );
  }

  Widget _buildActiveWallpaperCard(BuildContext context, bool isDesktop) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your Active ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFBB03B),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextSpan(
                        text: 'Wallpaper',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFEC0C43),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This wallpaper is currently set as your active background',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Category - ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Text(
                      activeCategory ?? 'Nature',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Selection - ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Text(
                      activeWallpaper ?? 'Wallpaper 5',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF8F8F8),
                ),
              ),
              const SizedBox(height: 8),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SetupScreen()),
                  );
                },
                icon: const Icon(Icons.settings_outlined),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF8F8F8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: isDesktop ? 60 : 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'ClashDisplay',
              height: 1.2,
            ),
            children: const [
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
        const SizedBox(height: 16),
        Text(
          'Discover curated collections of stunning wallpapers. Browse by\ncategory, preview in full-screen, and set your favorites.',
          style: TextStyle(
            fontSize: isDesktop ? 16 : 14,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection(BuildContext context, bool isDesktop) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = isDesktop ? 3 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: isDesktop ? 1.5 : 1.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
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
                );
              },
            );
          },
        ),
      ],
    );
  }
}
