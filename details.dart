import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserDetailsPage(),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gopi Chand',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text('Roll No: 21KP1A4413'),
                    Text('Email: gopichandbandaru243@gmail.com'),
                    Text('Phone: 9110514952'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add logic for the first button here
                },
                child: Text('Daily'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add logic for the second button here
                },
                child: Text('Monthly'),
              ),
            ],
          ),
          SizedBox(height: 40.0,),
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                
                children: [
                  TableCell(child: Text('Date',textAlign: TextAlign.center,)),
                  TableCell(child: Text('1st',textAlign: TextAlign.center,)),
                  TableCell(child: Text('2nd',textAlign: TextAlign.center,)),
                  TableCell(child: Text('3rd',textAlign: TextAlign.center,)),
                  TableCell(child: Text('4th',textAlign: TextAlign.center,)),
                  TableCell(child: Text('5th',textAlign: TextAlign.center,)),
                  TableCell(child: Text('6th',textAlign: TextAlign.center,)),
                  TableCell(child: Text('7th',textAlign: TextAlign.center,)),
                  TableCell(child: Text('8th',textAlign: TextAlign.center,)),
                  TableCell(child: Text('Attendance')),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('2023-08-01',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('Present')),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('2023-08-02')),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('p',textAlign: TextAlign.center,)),
                  TableCell(child: Text('A',textAlign: TextAlign.center,)),
                  TableCell(child: Text('A',textAlign: TextAlign.center,)),
                  TableCell(child: Text('A',textAlign: TextAlign.center,)),
                  TableCell(child: Text('A',textAlign: TextAlign.center,)),
                  TableCell(child: Text('Absent')),
                ],
              ),
              // Add more rows as needed
            ],
          ),
          SizedBox(height: 100),
          Expanded(
            child: charts.BarChart(
              _createSampleData(),
              animate: true,
            ),
          ),
        ],
      ),
    );
  }

  List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('Present', 5),
      OrdinalSales('Absent', 3),
      OrdinalSales('Late', 2),
      OrdinalSales('Excused', 1),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Attendance',
        domainFn: (OrdinalSales sales, _) => sales.category,
        measureFn: (OrdinalSales sales, _) => sales.value,
        data: data,
      ),
    ];
  }
}

class OrdinalSales {
  final String category;
  final int value;

  OrdinalSales(this.category, this.value);
}
