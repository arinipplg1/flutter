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
        title: Text("Contoh Layout Flutter"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Column Widget
              SectionTitle(title: 'Column Widget'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Item 1'),
                  Text('Item 2'),
                  Text('Item 3'),
                ],
              ),
              SizedBox(height: 20),

              // 2. Row Widget
              SectionTitle(title: 'Row Widget'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Row Item 1'),
                  Text('Row Item 2'),
                  Text('Row Item 3'),
                ],
              ),
              SizedBox(height: 20),

              // 3. ListView Widget
              SectionTitle(title: 'ListView Widget'),
              Container(
                height: 150,
                color: Colors.blue[50],
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListItem(color: Colors.red, label: 'Item 1'),
                    ListItem(color: Colors.green, label: 'Item 2'),
                    ListItem(color: Colors.orange, label: 'Item 3'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // 4. GridView Widget
              SectionTitle(title: 'GridView Widget'),
              Container(
                height: 200,
                color: Colors.blue[50],
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(6, (index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      color: Colors.teal[300],
                      child: Center(child: Text('Grid Item ${index + 1}')),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),

              // 5. Padding Widget
              SectionTitle(title: 'Padding Widget'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.amber,
                  child: Text('This is a Padding widget', style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 20),

              // 6. AspectRatio Widget
              SectionTitle(title: 'AspectRatio Widget'),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.red,
                  child: Center(child: Text('Aspect Ratio 16:9')),
                ),
              ),
              SizedBox(height: 20),

              // 7. Center Widget
              SectionTitle(title: 'Center Widget'),
              Center(
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(20),
                  child: Text('Centered Text', style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),

              // 8. Expanded Widget
              SectionTitle(title: 'Expanded Widget'),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 50,
                      child: Center(child: Text('Expanded 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                      height: 50,
                      child: Center(child: Text('Expanded 2')),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // 9. SizedBox Widget
              SectionTitle(title: 'SizedBox Widget'),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('SizedBox Button'),
                ),
              ),
              SizedBox(height: 20),

              // 10. Wrap Widget
              SectionTitle(title: 'Wrap Widget'),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(6, (index) {
                  return Container(
                    color: Colors.orange,
                    padding: EdgeInsets.all(8),
                    child: Text('Wrap Item ${index + 1}'),
                  );
                }),
              ),
              SizedBox(height: 20),

              // 11. Stack Widget
              SectionTitle(title: 'Stack Widget'),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                  ),
                  Positioned(
                    top: 20,
                    child: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Top Positioned', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Bottom Positioned', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget for Section Title
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

// Custom ListItem Widget for ListView
class ListItem extends StatelessWidget {
  final Color color;
  final String label;

  const ListItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      color: color,
      child: Center(child: Text(label, style: TextStyle(color: Colors.white))),
    );
  }
}