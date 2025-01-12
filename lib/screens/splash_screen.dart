import 'package:flutter/material.dart';
import 'login.dart'; // Import halaman Login

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Splash.png'), // Gambar sebagai background
            fit: BoxFit.cover, // Mengisi seluruh layar
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyebar elemen di sepanjang sumbu utama
          children: [
            Container(), // Container kosong untuk mendorong elemen ke bawah
            Column(
              children: [
                // Teks di bagian bawah layar
                Text(
                  'MAKE HOME FOR',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks agar kontras dengan background
                  ),
                ),
                SizedBox(height: 10), // Mengurangi jarak antara teks
                // Teks di bagian bawah layar
                Text(
                  'BETTER LIVING',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks agar kontras dengan background
                  ),
                ),
                SizedBox(height: 40), // Memberi ruang di bawah teks
                // Tombol Get Started
                ElevatedButton(
                  onPressed: () {
                    // Arahkan ke halaman Login saat tombol ditekan
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text('Get Started'),
                ),
                SizedBox(height: 20), // Memberi ruang di bawah tombol
              ],
            ),
          ],
        ),
      ),
    );
  }
}



