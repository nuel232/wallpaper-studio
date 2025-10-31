// Browse Screen
import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  final Function(String, String) onWallpaperSet;
  final List<Wallpaper> favorites;
  final Function(Wallpaper) onToggleFavorite;
  final bool Function(Wallpaper) isFavorite;

  const BrowseScreen({
    Key? key,
    required this.onWallpaperSet,
    required this.favorites,
    required this.onToggleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Browse Wallpapers',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.wallpapers.length,
                  itemBuilder: (context, wIndex) {
                    final wallpaper = category.wallpapers[wIndex];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WallpaperDetailScreen(
                                wallpaper: wallpaper,
                                category: category,
                                onWallpaperSet: onWallpaperSet,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(wallpaper.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
