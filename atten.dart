import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_datetime_picker/src/datetime_picker_theme.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Post Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AttendancePostPage(),
    );
  }
}

class AttendancePostPage extends StatefulWidget {
  @override
  _AttendancePostPageState createState() => _AttendancePostPageState();
}

class _AttendancePostPageState extends State<AttendancePostPage> {
  TextEditingController _dateController = TextEditingController();
  late String _selectedItem1;
  late String _selectedItem2;
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Post Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Text Field'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _dateController.text =
                                date.toString().split(' ')[0];
                          });
                        },
                        currentTime: DateTime.now(),
                      );
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Date Picker',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedItem1,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem1 = value!;
                      });
                    },
                    items: ['Option 1', 'Option 2', 'Option 3']
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    hint: Text('Dropdown 1'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedItem2,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem2 = value!;
                      });
                    },
                    items: ['Choice A', 'Choice B', 'Choice C']
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    hint: Text('Dropdown 2'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentColor = Colors.red;
                    });
                  },
                  child: Text('Red'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentColor = Colors.green;
                    });
                  },
                  child: Text('Green'),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentColor = Colors.blue;
                    });
                  },
                  child: Text('Blue'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to submit attendance here
                String date = _dateController.text;
                String selectedItem1 = _selectedItem1;
                String selectedItem2 = _selectedItem2;

                // Perform attendance submission logic
                // You can send the data to a server or save locally

                // Example: Printing the entered data
                print('Date: $date');
                print('Dropdown 1: $selectedItem1');
                print('Dropdown 2: $selectedItem2');
                print('Color: $_currentColor');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
