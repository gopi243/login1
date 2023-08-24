import 'package:flutter/material.dart';
import 'package:login/flogin.dart';


void main() {
  runApp(MyApp());
}

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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  bool _showOtpField = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void showSnackBarFunction(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Registration Page'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/page1.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 30),
                const Text(
                  'WELCOME!',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic),
                  textAlign: TextAlign.start,
                ),
                // SizedBox(height: 5),
                const Text(
                  'Enter your details here.',
                  style: TextStyle( fontWeight: FontWeight.normal,color: Colors.grey,fontStyle: FontStyle.italic),
                  textAlign: TextAlign.start,
                ),
                // SizedBox(height:5),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  fillColor: Colors.black,
                  filled: true,
                  prefixIcon: Icon(Icons.person,color: Colors.white,)
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              
                TextFormField(
                  controller: _emailController,
                  
                  decoration: InputDecoration(labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  fillColor: Colors.black,
                  filled: true,
                  prefixIcon: Icon(Icons.email,color: Colors.white,)
                  ),
                  style: TextStyle(color: Colors.white),
                ),
            
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  fillColor: Colors.black,
                  filled: true,
                  prefixIcon: Icon(Icons.phone,color: Colors.white,)
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 1),
                if (_showOtpField)
                  TextFormField(
                    controller: _otpController,
                    decoration: InputDecoration(labelText: 'Verification Code',labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  fillColor: Colors.black,
                  filled: true,
                  prefixIcon: Icon(Icons.code,color: Colors.white,)),
                  style: TextStyle(color: Colors.white),
                  ),
                // const SizedBox(height: 1),
                // FilledButton.icon(
                //   onPressed: () async {
                //     final result = await signInWithGoogle();
                //     if (result.user != null) {
                //       showSnackBarFunction("Successful login");
                //     } else {
                //       showSnackBarFunction("Error");
                //     }
                //   },
                //   label: Text("Google"),
                //   icon: Icon(Icons.login),
                // ),
                ElevatedButton(
                  onPressed: ()  {
                    String name = _nameController.text;
                    String email = _emailController.text;
                    String phone = _phoneController.text;
                    String otp = _otpController.text;
                  },
                  child: Text('Submit',style: 
                  TextStyle(color: Colors.white,fontSize: 20.0,),
                  ),

                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage2()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  signInWithGoogle() {}
}


// Other methods and classes remain the same
