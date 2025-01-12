import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FavoriteItem {
  final String imagePath;
  final String name;
  final String description;
  final String price;

  FavoriteItem({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FavoriteItem &&
        other.imagePath == imagePath &&
        other.name == name &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode =>
      imagePath.hashCode ^ name.hashCode ^ description.hashCode ^ price.hashCode;
}

class Product {
  final String image;
  final String name;
  final String description;
  final String price;
  final String videoUrl; // Tambahkan URL video
  bool isSelected; // Tambahkan properti isSelected

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.videoUrl,
    this.isSelected = false, // Inisialisasi dengan false
  });
}

class ProductData {
  static List<String> getItemsForCategory(String category) {
    switch (category) {
      case 'Tables':
        return ['assets/tables1.png', 'assets/tables2.png'];
      case 'Chairs':
        return ['assets/chair1.png', 'assets/chair2.png'];
      case 'Lamps':
        return ['assets/lampu1.png', 'assets/lampu2.png'];
      case 'All':
      default:
        return [
          'assets/tables1.png',
          'assets/tables2.png',
          'assets/chair1.png',
          'assets/chair2.png',
          'assets/lampu1.png',
          'assets/lampu2.png',
        ];
    }
  }

  static List<String> getProductNames(String category) {
    switch (category) {
      case 'Tables':
        return ['Dining Table', 'Coffee Table'];
      case 'Chairs':
        return ['Office Chair', 'Lounge Chair'];
      case 'Lamps':
        return ['Table Lamp', 'Floor Lamp'];
      case 'All':
      default:
        return [
          'Dining Table',
          'Coffee Table',
          'Office Chair',
          'Lounge Chair',
          'Table Lamp',
          'Floor Lamp',
        ];
    }
  }

  static List<String> getProductDescriptions(String category) {
    switch (category) {
      case 'Tables':
        return ['Elegant dining table.', 'Modern coffee table.'];
      case 'Chairs':
        return ['Comfortable office chair.', 'Stylish lounge chair.'];
      case 'Lamps':
        return ['Classic table lamp.', 'Contemporary floor lamp.'];
      case 'All':
      default:
        return [
          'Elegant dining table.',
          'Modern coffee table.',
          'Comfortable office chair.',
          'Stylish lounge chair.',
          'Classic table lamp.',
          'Contemporary floor lamp.',
        ];
    }
  }

  static List<String> getProductPrices(String category) {
    switch (category) {
      case 'Tables':
        return ['\$150', '\$200'];
      case 'Chairs':
        return ['\$100', '\$120'];
      case 'Lamps':
        return ['\$50', '\$75'];
      case 'All':
      default:
        return [
          '\$150',
          '\$200',
          '\$100',
          '\$120',
          '\$50',
          '\$75',
        ];
    }
  }

  static List<String> getProductVideos(String category) {
    switch (category) {
      case 'Tables':
        return [
          'https://youtu.be/aPJbdVQGWPE',
          'https://www.youtube.com/watch?v=3JZ_D3ELwOQ'
        ];
      case 'Chairs':
        return [
          'https://www.youtube.com/watch?v=QtXby3twMmI',
          'https://www.youtube.com/watch?v=kJQP7kiw5Fk'
        ];
      case 'Lamps':
        return [
          'https://www.youtube.com/watch?v=2Vv-BfVoq4g',
          'https://www.youtube.com/watch?v=L_jWHffIx5E'
        ];
      case 'All':
      default:
        return [
          'https://youtu.be/aPJbdVQGWPE',
          'https://www.youtube.com/watch?v=3JZ_D3ELwOQ',
          'https://www.youtube.com/watch?v=QtXby3twMmI',
          'https://www.youtube.com/watch?v=kJQP7kiw5Fk',
          'https://www.youtube.com/watch?v=2Vv-BfVoq4g',
          'https://www.youtube.com/watch?v=L_jWHffIx5E'
        ];
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FavoriteItem> favoriteItems = [];
  List<Product> cartItems = [];
  String selectedCategory = 'All';

  void toggleFavorite(FavoriteItem item) {
    setState(() {
      if (favoriteItems.contains(item)) {
        favoriteItems.remove(item);
      } else {
        favoriteItems.add(item);
      }
    });
  }

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  void filterCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ProductData.getItemsForCategory(selectedCategory);
    final allNames = ProductData.getProductNames(selectedCategory);
    final allDescriptions = ProductData.getProductDescriptions(selectedCategory);
    final allPrices = ProductData.getProductPrices(selectedCategory);
    final allVideos = ProductData.getProductVideos(selectedCategory);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello SYIFA'),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFF854F6C)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFDFB6B2),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryButton(title: 'All', onTap: () => filterCategory('All')),
                SizedBox(width: 10),
                CategoryButton(title: 'Tables', onTap: () => filterCategory('Tables')),
                SizedBox(width: 10),
                CategoryButton(title: 'Chairs', onTap: () => filterCategory('Chairs')),
                SizedBox(width: 10),
                CategoryButton(title: 'Lamps', onTap: () => filterCategory('Lamps')),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: allItems.length,
                itemBuilder: (context, index) {
                  final item = FavoriteItem(
                    imagePath: allItems[index],
                    name: allNames[index],
                    description: allDescriptions[index],
                    price: allPrices[index],
                  );

                  final product = Product(
                    image: item.imagePath,
                    name: item.name,
                    description: item.description,
                    price: item.price,
                    videoUrl: allVideos[index], // Tambahkan video URL
                  );

                  return GestureDetector(
                    onTap: () async {
                      final url = product.videoUrl;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(item.imagePath, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Text(item.price, style: TextStyle(color: Colors.green)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  favoriteItems.contains(item) ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () => toggleFavorite(item),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_shopping_cart),
                                onPressed: () => addToCart(product),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF854F6C), // Warna untuk item yang dipilih
        unselectedItemColor: Color(0xFF854F6C), // Warna untuk item yang tidak dipilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF854F6C)), // Ikon Home dengan warna
            label: '', // Tidak ada label untuk Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Color(0xFF854F6C)), // Ikon Favorite dengan warna
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Color(0xFF854F6C)), // Ikon Cart dengan warna
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Notifications',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage(favoriteItems: favoriteItems)),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()), // Navigasi ke NotificationPage
              );
              break;
          }
        },
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  CategoryButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF854F6C),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> notifications = [];
  final List<String> contacts = ['Alice', 'Bob', 'Charlie']; // Contoh daftar kontak

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'your_channel_id', // Unique channel ID
      'Your Channel Name', // Channel name
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      playSound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> _showNotification(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id',
      'Your Channel Name',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Message',
      message,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  void _sendMessage(String contact) {
    final message = 'Message sent to $contact!';
    setState(() {
      notifications.add(message);
    });
    _showNotification(message);
  }

  void clearNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: clearNotifications,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: notifications.isEmpty
                ? Center(child: Text('No notifications yet.'))
                : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:
                  Icon(Icons.notifications, color: Color(0xFF854F6C)),
                  title: Text(notifications[index]),
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text(contacts[index]),
                  trailing: ElevatedButton(
                    onPressed: () => _sendMessage(contacts[index]),
                    child: Text('Send Message'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Product> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = widget.cartItems;
  }

  double calculateTotalPrice() {
    return cartItems
        .where((product) => product.isSelected)
        .fold(0.0, (sum, product) {
      // Menghapus tanda dolar dan mengonversi ke double
      final price = double.tryParse(product.price.replaceAll('\$', '')) ?? 0.0;
      return sum + price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text('Your cart is empty.'),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(item.image, width: 50),
                  title: Text(item.name),
                  subtitle: Text(item.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: item.isSelected,
                        onChanged: (value) {
                          setState(() {
                            item.isSelected = value!;
                          });
                        },
                      ),
                      Text(item.price),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final selectedItems = cartItems
                        .where((product) => product.isSelected)
                        .toList();

                    if (selectedItems.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('No items selected!'),
                      ));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Order Placed'),
                            content: Text('Your order has been placed successfully!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Pesan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Tambahkan halaman CartPage dan FavoritePage sesuai dengan kode sebelumnya
class FavoritePage extends StatelessWidget {
  final List<FavoriteItem> favoriteItems;

  FavoritePage({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Items')),
      body: favoriteItems.isEmpty
          ? Center(child: Text('No favorite items yet.'))
          : ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return ListTile(
            leading: Image.asset(item.imagePath, width: 50),
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Text(item.price),
          );
        },
      ),
    );
  }
}

