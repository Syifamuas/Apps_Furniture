import 'package:flutter/material.dart';
import 'login.dart'; // Pastikan import halaman Login yang benar

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFD4C2B4), // Background warna D4C2B4
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input untuk Username
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true, // Mengisi background pada input field
                fillColor: Colors.white.withOpacity(0.5), // Background putih dengan transparansi
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Input untuk Password
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white.withOpacity(0.5), // Background putih dengan transparansi
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Menyembunyikan teks password
            ),
            SizedBox(height: 20),
            // Input untuk Konfirmasi Password
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                filled: true,
                fillColor: Colors.white.withOpacity(0.5), // Background putih dengan transparansi
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Menyembunyikan teks password
            ),
            SizedBox(height: 20),
            // Tombol Registrasi
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman success setelah registrasi
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationSuccessPage(),
                  ),
                );
              },
              child: Text('Registrasi'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menghapus AppBar agar tampilan lebih sederhana, jika ingin mempertahankannya bisa ditambahkan
      appBar: AppBar(
        title: Text('Registrasi Berhasil'),
      ),
      body: Container(
        color: Color(0xFFD4C2B4), // Mengatur latar belakang berwarna D4C2B4
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Pesan sukses
              Text(
                'Selamat! Anda telah berhasil registrasi.',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center, // Teks ditengah
              ),
              SizedBox(height: 20), // Jarak antar elemen
              // Pesan login
              Text(
                'You can now login with your account',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40), // Jarak sebelum tombol
              // Tombol GO TO LOGIN
              ElevatedButton(
                onPressed: () {
                  // Arahkan ke halaman login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(), // Halaman login
                    ),
                  );
                },
                child: Text('GO TO LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}