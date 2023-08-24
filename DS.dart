import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Branch',
      home: DropdownExample(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String selectedDSOption = 'DS-A 1ST';
  String selectedITOption = 'IT 1ST';

  List<String> dsOptions = [
    'DS-A 1ST',
    'DS-B 1ST',
    'DS-C 1ST',
    'DS-A 2ND',
    'DS-B 2ND',
    'DS-C 2ND',
    'DS-A 3RD',
    'DS-B 3RD',
    'DS-A 4TH',
  ];

  List<String> itOptions = [
    'IT 1ST',
    'IT 2ND',
    'IT 3RD',
    'IT 4TH',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/branch.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100), // Adding space for the heading
              Text(
                'Branch', // Your heading here
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 190), // Adding space between heading and buttons
              Container(
                width: MediaQuery.of(context).size.width * 0.7, // Increase the button width
                padding: EdgeInsets.all(10.0), // Increase the button padding
                child: ElevatedButton(
                  onPressed: () {
                    showDSOptionsDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 52, 237, 203),
                  ),
                  child: Text(
                    'DS', // Button label
                    style: TextStyle(fontSize: 24), // Increase the button font size
                  ),
                ),
              ),
              SizedBox(height: 20), // Adding space between buttons
              Container(
                width: MediaQuery.of(context).size.width * 0.7, // Increase the button width
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                  showITOptionsDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 52, 237, 203),
                  ),
                  child: Text(
                    'IT', // Button label
                    style: TextStyle(fontSize: 24), // Increase the button font size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDSOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select DS Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: dsOptions.map((option) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyWidget(option)),
                  );

                  setState(() {
                    selectedDSOption = option;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 102, 114, 247),
                ),
                child: Text(option),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void showITOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select IT Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: itOptions.map((option) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedITOption = option;
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 102, 114, 247),
                ),
                child: Text(option),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  final String option;

  MyWidget(this.option);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Option'),
      ),
      body: Center(
        child: Text('You selected: $option'),
      ),
    );
  }
}
