import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateClass(),
    );
  }
}

class CreateClass extends StatefulWidget {
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
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
        title: Text('Create Class ',style: TextStyle(color: Colors.black),),      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             Image.asset(
              'assets/ps1.png',
              width: 200,
              height: 200,),
            Text(
              'Create class !',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _textEditingController1,
              decoration: InputDecoration(
                labelText: 'Branch',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: _textEditingController2,
              decoration: InputDecoration(
                labelText: 'Year',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: _textEditingController3,
              decoration: InputDecoration(
                labelText: 'Section',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                
                // Perform action with input values if needed
                
                // Navigate to successful page
                _showSuccessfulPage();
              },
              child: Text('Create',style: TextStyle(fontSize: 20.0),),
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
        title: Text('Class page'),
      ),
      body: Center(
        child: Text(
          'SUCCESSFULLY CREATED A CLASS !',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}