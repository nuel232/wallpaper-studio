// Favorites Screen
import 'package:flutter/material.dart';
import 'package:wallpaper_studio/models/wallpaper.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Wallpaper> favorites;
  final Function(String, String) onWallpaperSet;
  final Function(Wallpaper) onToggleFavorite;
  final bool Function(Wallpaper) isFavorite;

  const FavoritesScreen({
    Key? key,
    required this.favorites,
    required this.onWallpaperSet,
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
          'Favorites',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final wallpaper = favorites[index];
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(wallpaper.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Color(0xFFEC0C43),
                          ),
                          onPressed: () => onToggleFavorite(wallpaper),
                          iconSize: 20,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
