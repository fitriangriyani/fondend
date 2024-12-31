import 'package:flutter/material.dart';
import 'profile.dart';
import 'favorites.dart';
import 'upload.dart';
import 'beranda.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tombol(),
    );
  }
}

class Tombol extends StatefulWidget {
  @override
  _TombolState createState() => _TombolState();
}

class _TombolState extends State<Tombol> {
  int _selectedIndex = 0; // Default selected index

  // List of pages for navigation
  final List<Widget> _pages = [
    HomePageContent(),
    SlimChefScreen(),
    HalamanTambahResep(),
    FavoriteRecipesPage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the selected index
        onTap: _onItemTapped, // Handle item taps
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Color(0xFF1A7F5D),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class SlimChefScreen extends StatelessWidget {
  const SlimChefScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // List of image assets
    final List<String> imagePaths = [
      'assets/gambar/chicken_steak.jpg',
      'assets/gambar/salad_sayur.jpg',
      'assets/gambar/salmon_panggang.jpg',
      'assets/gambar/tuna_salad.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'SlimChef',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 5),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Grid of food images
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columns for Instagram-like layout
                  crossAxisSpacing: 4, // Spacing between columns
                  mainAxisSpacing: 8, // Spacing between rows
                ),
                itemCount: imagePaths.length, // Number of images in the list
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Image.asset(
                        imagePaths[index], // Use image paths from the list
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
