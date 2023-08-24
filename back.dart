import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


final database = FirebaseDatabase.instance.refFromURL('https://fir-98218-default-rtdb.firebaseio.com/');

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  bool _showOtpField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Perform login navigation logic here
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Registration page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              SizedBox(height: 10),
              if (_showOtpField)
                TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(labelText: 'Verification Code'),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showOtpField = true;
                  });
                },
                child: Text(_showOtpField ? 'Resend code' : 'Send code'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String otp = _otpController.text;

    // Perform registration logic and validation
    // You can add more checks here before submitting

    // Example: Printing the values
    print('Name: $name');
    print('Email: $email');
    print('Phone: $phone');
    print('OTP: $otp');

    // Store the registration data in Firebase Realtime Database
    _database.child('users').push().set({
      'name': name,
      'email': email,
      'phone': phone,
      'otp': otp,
    });

    // Clear text fields and reset state
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _otpController.clear();
    setState(() {
      _showOtpField = false;
    });
  }
}
