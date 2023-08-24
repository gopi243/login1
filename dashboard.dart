import 'package:flutter/material.dart';
import 'package:login/studentcreate.dart';

import 'class.dart';
import 'faculty.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button and Menu Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection here
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'menu_item_1',
                child: Text('HOME'),
              ),
              PopupMenuItem<String>(
                value: 'menu_item_2',
                child: Text('ABOUT'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                // Handle button 1 click
              },
              child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('FACULTY'),
            ),
            style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0), // Remove padding
                    fixedSize: Size(200, 100),),),
                    SizedBox(height: 30.0,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateStudentScreen()));
                // Handle button 2 click
              },
              child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('STUDENTS'),
            ),style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0), // Remove padding
                    fixedSize: const Size(200, 100),),),
                    SizedBox(height: 30.0,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateClass()));
                // Handle button 3 click
              },
              child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('CLASSES'),
            ),style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0), // Remove padding
                    fixedSize: Size(200, 100),),),
                    SizedBox(height:30.0),
            ElevatedButton(
              onPressed: () {
                // Handle button 4 click
              },
              child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('ABSENTIES'),
            ),style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0), // Remove padding
                    fixedSize: Size(200, 100),),)
          ],
        ),
      ),
    );
  }
}
