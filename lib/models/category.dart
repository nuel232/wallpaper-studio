import 'package:wallpaper_studio/models/wallpaper.dart';

class Category {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int count;
  final List<Wallpaper> wallpapers;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.count,
    required this.wallpapers,
  });
}

// Sample Data
final List<Category> categories = [
  Category(
    id: '1',
    name: 'Nature',
    description: 'Mountains, Forest and Landscapes',
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
    count: 3,
    wallpapers: [
      Wallpaper(
        id: '1',
        name: 'Wallpaper 1',
        imageUrl:
            'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
      ),
      Wallpaper(
        id: '2',
        name: 'Wallpaper 2',
        imageUrl:
            'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
      ),
      Wallpaper(
        id: '3',
        name: 'Wallpaper 3',
        imageUrl:
            'https://images.unsplash.com/photo-1441974231531-c6227db76b6e',
      ),
    ],
  ),
  Category(
    id: '2',
    name: 'Abstract',
    description: 'Modern Geomentric and artistic designs',
    imageUrl: 'https://images.unsplash.com/photo-1557672172-298e090bd0f1',
    count: 4,
    wallpapers: [
      Wallpaper(
        id: '4',
        name: 'Wallpaper 4',
        imageUrl: 'https://images.unsplash.com/photo-1557672172-298e090bd0f1',
      ),
      Wallpaper(
        id: '5',
        name: 'Wallpaper 5',
        imageUrl: 'https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d',
      ),
      Wallpaper(
        id: '6',
        name: 'Wallpaper 6',
        imageUrl:
            'https://images.unsplash.com/photo-1567095761054-7a02e69e5c43',
      ),
      Wallpaper(
        id: '7',
        name: 'Wallpaper 7',
        imageUrl: 'https://images.unsplash.com/photo-1553356084-58ef4a67b2a7',
      ),
    ],
  ),
  Category(
    id: '3',
    name: 'Urban',
    description: 'Cities, architecture and street',
    imageUrl: 'https://images.unsplash.com/photo-1449824913935-59a10b8d2000',
    count: 6,
    wallpapers: [
      Wallpaper(
        id: '8',
        name: 'Wallpaper 8',
        imageUrl:
            'https://images.unsplash.com/photo-1449824913935-59a10b8d2000',
      ),
      Wallpaper(
        id: '9',
        name: 'Wallpaper 9',
        imageUrl:
            'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b',
      ),
      Wallpaper(
        id: '10',
        name: 'Wallpaper 10',
        imageUrl: 'https://images.unsplash.com/photo-1514565131-fce0801e5785',
      ),
    ],
  ),
  Category(
    id: '4',
    name: 'Space',
    description: 'Cosmos, planets, and galaxies',
    imageUrl: 'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a',
    count: 3,
    wallpapers: [
      Wallpaper(
        id: '11',
        name: 'Wallpaper 11',
        imageUrl:
            'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a',
      ),
      Wallpaper(
        id: '12',
        name: 'Wallpaper 12',
        imageUrl:
            'https://images.unsplash.com/photo-1462331940025-496dfbfc7564',
      ),
      Wallpaper(
        id: '13',
        name: 'Wallpaper 13',
        imageUrl:
            'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa',
      ),
    ],
  ),
  Category(
    id: '5',
    name: 'Minimalist',
    description: 'Clean, simple, and elegant',
    imageUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93',
    count: 6,
    wallpapers: [
      Wallpaper(
        id: '14',
        name: 'Wallpaper 14',
        imageUrl:
            'https://images.unsplash.com/photo-1509042239860-f550ce710b93',
      ),
      Wallpaper(
        id: '15',
        name: 'Wallpaper 15',
        imageUrl:
            'https://images.unsplash.com/photo-1504198266287-1659872e6590',
      ),
      Wallpaper(
        id: '16',
        name: 'Wallpaper 16',
        imageUrl:
            'https://images.unsplash.com/photo-1487147264018-f937fba0c817',
      ),
    ],
  ),
  Category(
    id: '6',
    name: 'Animals',
    description: 'Wildlife and nature photography',
    imageUrl: 'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f',
    count: 4,
    wallpapers: [
      Wallpaper(
        id: '17',
        name: 'Wallpaper 17',
        imageUrl:
            'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f',
      ),
      Wallpaper(
        id: '18',
        name: 'Wallpaper 18',
        imageUrl:
            'https://images.unsplash.com/photo-1456926631375-92c8ce872def',
      ),
      Wallpaper(
        id: '19',
        name: 'Wallpaper 19',
        imageUrl:
            'https://images.unsplash.com/photo-1474511320723-9a56873867b5',
      ),
    ],
  ),
];
