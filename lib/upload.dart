import 'package:flutter/material.dart';

// void main() {
//   runApp(HalamanTambahResep());
// }

// class AplikasiSaya extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HalamanTambahResep(),
//     );
//   }
// }

class HalamanTambahResep extends StatefulWidget {
  @override
  _HalamanTambahResepState createState() => _HalamanTambahResepState();
}

class _HalamanTambahResepState extends State<HalamanTambahResep> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'SlimChef', // Judul AppBar
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false, // Judul rata kiri
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
                  backgroundColor: Colors.orange,
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: 2, // Ikon tengah aktif
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
