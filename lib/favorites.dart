import 'package:flutter/material.dart';
import 'profile.dart';
import 'upload.dart';
import 'search.dart';
import 'beranda.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resep Favoritmu',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FavoriteRecipesPage(),
    );
  }
}

class FavoriteRecipesPage extends StatefulWidget {
  @override
  _FavoriteRecipesPageState createState() => _FavoriteRecipesPageState();
}

class _FavoriteRecipesPageState extends State<FavoriteRecipesPage> {
  // Daftar dummy resep favorit
  List<Map<String, String>> favoriteRecipes = [
    {'title': 'Salad Sayur', 'image': 'assets/gambar/salad_sayur.jpg'},
    {'title': 'Salmon Panggang', 'image': 'assets/gambar/salmon_panggang.jpg'},
    {'title': 'Tuna Salad', 'image': 'assets/gambar/tuna_salad.jpg'},
    {'title': 'Chicken Steak', 'image': 'assets/gambar/chicken_steak.jpg'},
  ];

  // Fungsi untuk menghapus item dari daftar
  void _removeRecipe(int index) {
    setState(() {
      favoriteRecipes.removeAt(index);
    });
  }

  int _currentIndex = 3;

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SlimChefScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HalamanTambahResep()),
        );
        break;
      case 3:
        // Tetap di halaman ini
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resep Favoritmu'),
      ),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  favoriteRecipes[index]['image']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                favoriteRecipes[index]['title']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'Hapus') {
                    _removeRecipe(index);
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Hapus',
                    child: Text('Hapus'),
                  ),
                ],
                icon: Icon(Icons.more_vert),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _navigateToPage(context, index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Tambah'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        selectedItemColor: Color(0xFF1A7F5D),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
