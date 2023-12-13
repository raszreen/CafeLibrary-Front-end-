import 'package:cafe_2/Beverage/beverage_listing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(tableOrderApp());
}

class tableOrderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table for order beverage',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: tableOrderPage(),
    );
  }
}

class tableOrderPage extends StatefulWidget {
  @override
  _tableOrderPageState createState() => _tableOrderPageState();
}

class _tableOrderPageState extends State<tableOrderPage> {
  final List<String> levelOptions = ['-Select Level-', 'Level 1', 'Level 2'];

  String _selectedLevel = '-Select Level-';


  void _submitForm() {
    print('Level: $_selectedLevel');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Your table has been submitted.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BeverageListing()),);
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table room for order beverage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButtonFormField(
              value: _selectedLevel,
              onChanged: (newValue) => setState(() {
                _selectedLevel = newValue!;
              }),
              items: levelOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter table number',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter table number';
                }
                return null;
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}