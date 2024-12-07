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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  // Variabel untuk TextField
  TextEditingController _nameController = TextEditingController();

  // Variabel untuk Dropdown
  String? _selectedAppliance = 'Kulkas';

  // Variabel untuk Switch
  bool _isSwitchOn = false;

  // Variabel untuk Radio
  String? _selectedRadio = 'Washing Machine';

  // Variabel untuk Checkbox
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Alat Rumah Tangga"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // 1. TextField Widget
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nama Alat Rumah Tangga",
                  hintText: "Masukkan nama alat",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.house),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama alat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // 2. Dropdown Widget
              DropdownButtonFormField<String>(
                value: _selectedAppliance,
                decoration: InputDecoration(
                  labelText: "Pilih Alat Rumah Tangga",
                  border: OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(child: Text('Kulkas'), value: 'Kulkas'),
                  DropdownMenuItem(child: Text('Kompor'), value: 'Kompor'),
                  DropdownMenuItem(child: Text('Mesin Cuci'), value: 'Mesin Cuci'),
                  DropdownMenuItem(child: Text('Blender'), value: 'Blender'),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedAppliance = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // 3. Switch Widget
              SwitchListTile(
                title: Text("Apakah Alat Ini Berfungsi?"),
                value: _isSwitchOn,
                onChanged: (bool value) {
                  setState(() {
                    _isSwitchOn = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // 4. Radio Widget
              ListTile(
                title: Text("Pilih Jenis Alat Rumah Tangga"),
              ),
              RadioListTile<String>(
                title: Text('Washing Machine'),
                value: 'Washing Machine',
                groupValue: _selectedRadio,
                onChanged: (String? value) {
                  setState(() {
                    _selectedRadio = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Microwave'),
                value: 'Microwave',
                groupValue: _selectedRadio,
                onChanged: (String? value) {
                  setState(() {
                    _selectedRadio = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // 5. Checkbox Widget
              CheckboxListTile(
                title: Text('Apakah alat ini baru?'),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
              SizedBox(height: 20),

              // 6. Dialog Widget
              ElevatedButton(
                onPressed: () => _showDialog(context),
                child: Text("Tampilkan Dialog"),
              ),
              SizedBox(height: 20),

              // 7. BottomSheet Widget
              ElevatedButton(
                onPressed: () => _showBottomSheet(context),
                child: Text("Tampilkan Bottom Sheet"),
              ),
              SizedBox(height: 20),

              // 8. Snackbar Widget
              ElevatedButton(
                onPressed: () => _showSnackbar(context),
                child: Text("Tampilkan Snackbar"),
              ),
              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Tampilkan hasil form
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form berhasil dikirim!")));
                  }
                },
                child: Text("Kirim Form"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dialog Method
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda yakin ingin mengirim form ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Form telah berhasil dikirim!")));
              },
              child: Text("Kirim"),
            ),
          ],
        );
      },
    );
  }

  // BottomSheet Method
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Informasi Alat Rumah Tangga", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text("Nama: ${_nameController.text}"),
              Text("Pilih Alat: $_selectedAppliance"),
            ],
          ),
        );
      },
    );
  }

  // Snackbar Method
  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Form berhasil disubmit!')),
    );
  }
}