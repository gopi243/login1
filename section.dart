import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DropdownButtonsPage(),
    );
  }
}

class DropdownButtonsPage extends StatefulWidget {
  @override
  _DropdownButtonsPageState createState() => _DropdownButtonsPageState();
}

class _DropdownButtonsPageState extends State<DropdownButtonsPage> {
  String _selectedOption1="";
  String _selectedOption2="";

  List<String> _options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Buttons Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Center(
                child: DropdownButton<String>(
                  value: _selectedOption1,
                  
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOption1 = "DS";
                    });
                  },
                  items: _options.map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text("DS-2nd"),
                    );
                  }).toList(),
                  hint: Text('Select an option'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
              child: Center(
                child: DropdownButton<String>(
                  value: _selectedOption2,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOption2 = "IT";
                    });
                  },
                  items: _options.map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text("IT-2nd"),
                    );
                  }).toList(),
                  hint: Text('Select an option'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
