import 'package:flutter/material.dart';
import 'favorite_page.dart';

// Model produk
class Product {
  final String image;
  final String name;
  final String description;
  final String price;

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });
}

class FavoritePage extends StatelessWidget {
  final List<Product> favoriteProducts;

  FavoritePage({required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
        backgroundColor: Colors.brown,
      ),
      body: favoriteProducts.isEmpty
          ? Center(
        child: Text(
          'No favorite items yet.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Image.asset(
                product.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.description),
                  SizedBox(height: 4),
                  Text(
                    product.price,
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
