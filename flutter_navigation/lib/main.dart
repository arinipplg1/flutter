import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black87, // Latar belakang lebih gelap
        primaryColor: Colors.teal, // Warna utama
        colorScheme: ColorScheme.dark(
          primary: Colors.teal,
          secondary: Colors.blueAccent, // Gantikan accentColor dengan secondary
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black87, // Tema AppBar gelap
          elevation: 0, // Menghilangkan bayangan AppBar
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black54,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white54,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Untuk mengontrol index BottomNavigationBar

  // Daftar halaman yang bisa dinavigasi
final List<Widget> _screens = <Widget>[
  HomeTab(),
  CategoriesTab(),
  CartTab(),
  ProfileTab(),
];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TokoSukaSuka"),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Halaman Tab untuk Home
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.home, size: 150, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(
              'Selamat datang di TokoKita!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Tab untuk Categories
class CategoriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.category, size: 150, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(
              'Kategori Produk',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Tab untuk Cart
class CartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart, size: 150, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(
              'Keranjang Belanja Anda',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Tab untuk Profile
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_circle, size: 150, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(
              'Profil Pengguna',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}