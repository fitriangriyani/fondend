import 'package:flutter/material.dart';
import 'profile.dart';
import 'favorites.dart';
import 'search.dart';
import 'upload.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Widget> _pages = [
    HomePageContent(),
    SlimChefScreen(),
    HalamanTambahResep(),
    FavoriteRecipesPage(),
    Profile(),
  ];

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoriteRecipesPage()),
        );
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
      body: HomePageContent(), // Default page for initial load
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: (index) => _navigateToPage(context, index),
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  final List<Map<String, String>> slideshow = [
    {'image': 'assets/gambar/slideshow1.png'},
    {'image': 'assets/gambar/slideshow2.png'},
    {'image': 'assets/gambar/slideshow3.png'},
  ];

  final List<Map<String, String>> recipes = [
    {'title': 'tuna salad', 'image': 'assets/gambar/tuna_salad.jpg'},
    {'title': 'salmon panggang', 'image': 'assets/gambar/salmon_panggang.jpg'},
    {'title': 'salad sayur', 'image': 'assets/gambar/salad_sayur.jpg'},
  ];
 
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % slideshow.length;
        });
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.orange,
          expandedHeight: 30,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: const Color(0xFF105a3b),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Text(
                      'SlimChef',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
  child: SizedBox(height: 20),
),
       SliverToBoxAdapter(
  child: Container(
    height: 250,
    child: PageView.builder(
      controller: PageController(viewportFraction: 0.85), // Mengatur jarak antar gambar
      itemCount: slideshow.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Menambahkan jarak antar gambar
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Lengkungan pada sudut gambar
            child: Image.asset(
              slideshow[index]['image']!,
              fit: BoxFit.cover, // Menyesuaikan ukuran gambar
            ),
          ),
        );
      },
    ),
  ),
),


        SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.all(10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF105a3b), // Warna border kotak
          borderRadius: BorderRadius.circular(8.0), // Opsional: Sudut melengkung
        ),
        padding: EdgeInsets.all(8.0), // Ruang antara teks dan border
        child: Text(
          'Masak Apa Hari Ini?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 254, 251, 243)
          ),
        ),
      ),
    ),
  ),
),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      recipes[index]['image']!,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        recipes[index]['title']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: recipes.length,
          ),
        ),
      ],
    );
  }
}
