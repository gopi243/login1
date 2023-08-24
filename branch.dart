import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Department of IT&DS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomDropdownGroup(title: 'DS', items: ['2nd-DS', '3rd-DS', '4th-DS']),
            SizedBox(height: 20),
            CustomDropdownGroup(title: 'IT', items: ['2nd-IT', '3rd-IT', '4th-IT']),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownGroup extends StatelessWidget {
  final String title;
  final List<String> items;

  const CustomDropdownGroup({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        DropdownButton<String>(
          value: items.first, // You can set the initial selected item here
          onChanged: (newValue) {
            // Handle dropdown value change
          },
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}
