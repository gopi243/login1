import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Code Assistance')),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String dropdownValue1 = 'post';
  String dropdownValue2 = '1st';
  DateTime selectedDate = DateTime.now();
  Color buttonColor = Colors.green;

  List<String> buttonLabels = List.generate(66, (index) => '21KP1A44${index + 1}');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'DS-A()',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Row(
                        children: [
                          Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      value: dropdownValue1,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue1 = newValue!;
                        });
                      },
                      items: <String>['post', 'update', 'check'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                      },
                      items: <String>[
                        '1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Spacer between rows
          Center(
            child: Column(
              children: buttonLabels.map((label) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonColor = Colors.red;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      buttonColor = Colors.blue;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return buttonColor;
                        }
                        return Colors.green;
                      },
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 18), // Adjust the font size here
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 10, horizontal: 100), // Adjust the padding here
                    ),
                    // Add any other button styling you need here
                  ),
                  child: Text(label),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20), // Spacer between rows
          Center(
            child: ElevatedButton(onPressed: () {}, child: Text('submit')),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
