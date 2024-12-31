import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ResepPage(),
    );
  }
}

class ResepPage extends StatefulWidget {
  @override
  _ResepPageState createState() => _ResepPageState();
}

class _ResepPageState extends State<ResepPage> {
  bool _isFavorite = false; // Status favorit resep
  bool _isReported = false; // Status apakah resep sudah dilaporkan
  int _currentIndex = 0; // Status untuk index bottom navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SlimChef'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar resep
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/gambar/salad_sayur.jpg', // Pastikan gambar ini ada di folder assets
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Judul resep
            Text(
              'Salad Sayur',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                // Ikon Like
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite; // Toggle status favorit
                    });
                  },
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Color(0xFF1A7F5D),
                  ),
                ),
                SizedBox(width: 16),
                // Ikon Report
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isReported = !_isReported; // Toggle status report
                    });
                  },
                  child: Icon(
                    _isReported ? Icons.flag_outlined : Icons.flag,
                    color: const Color.fromARGB(255, 57, 55, 55),
                  ),
                ),
                Spacer(), // Memberikan ruang antara ikon report dan ikon lainnya
                // Ikon lainnya
                GestureDetector(
                  onTap: () {
                    // Logika untuk menu lainnya
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
