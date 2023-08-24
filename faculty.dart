import 'package:flutter/material.dart';


void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _facultyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  void _submitForm() {
    // Handle form submission here
    String facultyName = _facultyNameController.text;
    String email = _emailController.text;
    String phoneNumber = _phoneNumberController.text;

    print('Faculty Name: $facultyName');
    print('Email: $email');
    print('Phone Number: $phoneNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 10),
            // Text(
            //   'Please provide your faculty information below',
            //   style: TextStyle(fontSize: 16),
            // ),
            SizedBox(height: 25),
            Image.asset(
              'assets/b2.png', // Replace with your image asset path
              height: 230,
              width: 550,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _facultyNameController,
              decoration: InputDecoration(labelText: 'Faculty Name',border: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0) )),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),

            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email',border: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0) )),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),

            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number',border: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0) )),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),

            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
