import 'package:flutter/material.dart';

import 'details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Input Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateClassText(),
    );
  }
}

class CreateClassText extends StatefulWidget {
  @override
  _CreateClassTextState createState() => _CreateClassTextState();
}

class _CreateClassTextState extends State<CreateClassText> {
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _textEditingController3 = TextEditingController();

  void _showSuccessfulPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return SuccessfulPage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Class Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Create Class',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _textEditingController1,
              decoration: InputDecoration(
                labelText: 'Branch',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _textEditingController2,
              decoration: InputDecoration(
                labelText: 'Year',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _textEditingController3,
              decoration: InputDecoration(
                labelText: 'Section',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String Branch = _textEditingController1.text;
                String Year = _textEditingController2.text;
                String Section = _textEditingController3.text;

                // Perform action with input values if needed
                
                // Navigate to successful page
                _showSuccessfulPage();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessfulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Successful'),
      ),
      body: Center(
        child: Text(
          'Successfully a class is created',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
