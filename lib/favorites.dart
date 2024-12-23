import 'package:flutter/material.dart';

void main() {
  runApp(FavoriteRecipesPage());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Resep Favoritmu',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: FavoriteRecipesPage(),
//     );
//   }
// }

class FavoriteRecipesPage extends StatefulWidget {
  @override
  _FavoriteRecipesPageState createState() => _FavoriteRecipesPageState();
}

class _FavoriteRecipesPageState extends State<FavoriteRecipesPage> {
  // Daftar dummy resep favorit
  List<Map<String, String>> favoriteRecipes = [
    {'title': 'salad sayur', 'image': 'assets/gambar/salad_sayur.jpg'},
    {'title': 'salmon panggang', 'image': 'assets/gambar/salmon_panggang.jpg'},
    {'title': 'tuna salad', 'image': 'assets/gambar/tuna_salad.jpg'},
    {'title': 'chicken steak', 'image': 'assets/gambar/chicken_steak.jpg'},
  ];

  // Fungsi untuk menghapus item dari daftar
  void _removeRecipe(int index) {
    setState(() {
      favoriteRecipes.removeAt(index);
    });
  }

  int _currentIndex = 0;

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
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
