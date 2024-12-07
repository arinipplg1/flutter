import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Basic Widgets"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Container widget
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.amber,
              child: Text(
                "This is a Container",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // Text widget
            Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Row widget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.search, size: 40, color: Colors.green),
              ],
            ),
            SizedBox(height: 20),

            // Column widget
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("First Item", style: TextStyle(fontSize: 18)),
                Text("Second Item", style: TextStyle(fontSize: 18)),
                Text("Third Item", style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 20),

            // CircleAvatar widget
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://www.example.com/profile.jpg'),
            ),
            SizedBox(height: 20),

            // Button widget (ElevatedButton)
            ElevatedButton(
              onPressed: () {
                // Button press action
                print("Button Pressed!");
              },
              child: Text("Press Me"),
            ),
            SizedBox(height: 20),

            // Image widget (Image.network)
            Image.network(
              'https://www.example.com/sample-image.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}