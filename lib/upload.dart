import 'package:flutter/material.dart';
import 'profile.dart';
import 'favorites.dart';
import 'search.dart';
import 'beranda.dart';

void main() {
  runApp(SlimChefApp());
}

class SlimChefApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanTambahResep(),
    );
  }
}

class HalamanTambahResep extends StatefulWidget {
  @override
  _HalamanTambahResepState createState() => _HalamanTambahResepState();
}

class _HalamanTambahResepState extends State<HalamanTambahResep> {
  // Variabel untuk melacak indeks tab aktif
  int _currentIndex = 2;

  // Daftar untuk menyimpan bahan dan langkah
  List<String> daftarBahan = [];
  List<String> daftarLangkah = [];

  // Kontrol teks untuk input bahan dan langkah
  TextEditingController kontrolBahan = TextEditingController();
  TextEditingController kontrolLangkah = TextEditingController();

  // Fungsi untuk menambah bahan
  void tambahBahan() {
    setState(() {
      daftarBahan.add(kontrolBahan.text);
      kontrolBahan.clear();
    });
  }

  // Fungsi untuk menambah langkah
  void tambahLangkah() {
    setState(() {
      daftarLangkah.add(kontrolLangkah.text);
      kontrolLangkah.clear();
    });
  }

  // Fungsi untuk menghapus bahan
  void hapusBahan(int indeks) {
    setState(() {
      daftarBahan.removeAt(indeks);
    });
  }

  // Fungsi untuk menghapus langkah
  void hapusLangkah(int indeks) {
    setState(() {
      daftarLangkah.removeAt(indeks);
    });
  }

  // Fungsi navigasi
  void _navigateToPage(BuildContext context, int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePageContent()),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF1A7F5D),
        unselectedItemColor: Colors.grey,
        onTap: (index) => _navigateToPage(context, index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'SlimChef',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Gambar dan Judul Resep
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                  child: Icon(Icons.add, color: Colors.white, size: 40),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan Judul Resep',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Bagian Bahan-Bahan
            Text('Bahan-Bahan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: daftarBahan.map((bahan) {
                int indeks = daftarBahan.indexOf(bahan);
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: TextEditingController(text: bahan),
                        decoration: InputDecoration(
                          hintText: 'Tambahkan bahan',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (nilaiBaru) {
                          setState(() {
                            daftarBahan[indeks] = nilaiBaru;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.red),
                      onPressed: () => hapusBahan(indeks),
                    ),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: tambahBahan,
              child: Text('Tambah Bahan'),
            ),

            // Bagian Langkah Pembuatan
            SizedBox(height: 24),
            Text('Langkah Pembuatan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: daftarLangkah.map((langkah) {
                int indeks = daftarLangkah.indexOf(langkah);
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: TextEditingController(text: langkah),
                        decoration: InputDecoration(
                          hintText: 'Tambahkan langkah',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (nilaiBaru) {
                          setState(() {
                            daftarLangkah[indeks] = nilaiBaru;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.red),
                      onPressed: () => hapusLangkah(indeks),
                    ),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: tambahLangkah,
              child: Text('Tambah Langkah'),
            ),

            // Tombol Simpan
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A7F5D),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  // Tambahkan aksi simpan di sini
                },
                child: Text('Simpan', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
