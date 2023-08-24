import 'package:flutter/material.dart';
import 'package:login/adminlogin.dart';

void main(){
  runApp(FirebaseBranch());
}

class FirebaseBranch extends StatefulWidget {
  const FirebaseBranch({super.key});

  @override
  State<FirebaseBranch> createState() => _FirebaseBranchState();
}

class _FirebaseBranchState extends State<FirebaseBranch> {
  String? _branch;
  String? _year;
  String? _section;
  // final _nameController = TextEditingController();
  // final _rollcontroller = TextEditingController();

//   void showSnackbarScreen(String e) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text(
//           e,
//           style: TextStyle(fontSize: 25),
//         ),
//         actions: [
//           FilledButton.icon(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (ctx) => AdminScreen()));
//               },
//               icon: Icon(Icons.emoji_nature_outlined),
//               label: Text("Okay"))
//         ],
//       ),
//     );
//   }

//   Future<bool> addBranchYearSection(Student student) async {
//     final branchDataBase = database.child('/branches/$_branch');
//     await branchDataBase.set({'name': _branch});

//     final sectionDatabase = database.child("/secions/$_section");
//     await sectionDatabase.set({
//       "brach_id": _branch,
//       'name': _section,
//     });

//     final studentDatabase = database.child('/students/${student.roll_number}');
//     await studentDatabase.set({
//       'name': student.name,
//       'roll_number': student.roll_number,
//       'section_id': student.section_id,
//       'year': student.year
//     });
//     showSnackbarScreen("Sucessfull");
//     final isAdd = false;

//     final dataTime = DateTime.now();
//     final attendanceDatabase = database.child(
//         '/attendance/${dataTime.day}-${dataTime.month}-${dataTime.year}/${student.roll_number}');

//     final Map<String, bool> tempAttendence = {};
//     for (var i = 1; i < 9; i++) {
//       tempAttendence.addAll({'period$i': false});
//     }
//     await attendanceDatabase.set(tempAttendence);
//     return true;
//   }

//   // Future<List<String>> getStudentId() async {
//   //   List<String> listOfStudentIds = [];

//   //   // ignore: unused_local_variable
//   //   database.child('attendance').onValue.listen((event) {
//   //     DataSnapshot snapshot = event.snapshot;
//   //     if (snapshot.value != null) {
//   //       print(snapshot.value);
//   //     }
//   //   });
//   //   return await listOfStudentIds;
//   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _branch,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  hint: const Text("Enter branch"),
                  icon: const Icon(Icons.home_work_outlined),
                  items: ['CSE', 'DS', 'IT', 'ECE']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Please enter";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _branch = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _year,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  hint: const Text("Enter Year"),
                  icon: const Icon(Icons.calculate),
                  items: ['20KP', '21KP', '22KP', '23KP']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Please enter";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _year = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _section,
                  hint: const Text("Enter Section"),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  icon: const Icon(Icons.group),
                  items: ['Section-A', 'Section-B']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Please enter";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _section = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // TextFormField(
                //   controller: _nameController,
                //   decoration: InputDecoration(
                //       labelText: "Enter your name",
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10))),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   controller: _rollcontroller,
                //   decoration: InputDecoration(
                //       labelText: "Enter your rollnumber",
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10))),
                // ),
                const SizedBox(
                  height: 10,
                ),
                FilledButton.icon(
                  onPressed: () async {
                    // await addBranchYearSection(Student(
                    //     _nameController.text,
                    //     _rollcontroller.text,
                    //     _section.toString(),
                    //     _year.toString()));
                  },
                  icon: const Icon(Icons.arrow_downward),
                  label: const Text("Enter"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}