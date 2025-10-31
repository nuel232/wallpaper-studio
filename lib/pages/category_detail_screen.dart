import 'package:flutter/material.dart';
import 'package:wallpaper_studio/models/category.dart';
import 'package:wallpaper_studio/pages/wallpaper_detail_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;
  final Function(String, String) onWallpaperSet;

  const CategoryDetailScreen({
    Key? key,
    required this.category,
    required this.onWallpaperSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          category.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.view_list, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(isDesktop ? 40 : 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isDesktop ? 4 : 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: category.wallpapers.length,
        itemBuilder: (context, index) {
          final wallpaper = category.wallpapers[index];
          return InkWell(
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(wallpaper.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
