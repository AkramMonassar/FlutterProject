import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_delivery/business/authSignInSignUp.dart';
import 'package:school_delivery/ui/Feature/Login%20Screen/Login_Screen_Supervisor.dart';
import 'package:school_delivery/ui/users_Interface5.dart';

import 'add_New_Student17.dart';
import 'modify_New_Student17.dart';

class PreparingStudents16 extends StatefulWidget {
  const PreparingStudents16({Key? key}) : super(key: key);

  @override
  State<PreparingStudents16> createState() => _PreparingStudents16();
}

class _PreparingStudents16 extends State<PreparingStudents16> {
  List studentsGListObject = [];
  // late QuerySnapshot snap;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('StudentsG');
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getStudentsDetailsList();
  }

  @override
  Widget build(BuildContext context) {
    getStudentsDetailsList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:  Directionality(
              textDirection: TextDirection.rtl,
              child: Text('تحضير الطلاب / المشرف : ${user.email} ')),
        ),
        body: SafeArea(
            child: Stack(children: [
          Scaffold(
            appBar: AppBar(
              title: MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserInterface5()));
                },
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("اذا كنت تريد الخروج ؟ "),
                      Text("تسجيل الخروج")
                    ],
                  ),
                ),
              ),
            ),
            backgroundColor: const Color(
                0xffecefe4), // make the Scaffold background transparent
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          setState(() {});
                        },
                        child: StreamBuilder(
                          stream: collectionReference.snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(' حدث خطأ  ${snapshot.hasError}'),
                              );
                            }
                            print(
                                "snapshot in streamBuilder : ${snapshot.hasData}");

                            return DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'الاسم',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                DataColumn(
                                    label: Text(
                                  'رقم الهاتف',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                                DataColumn(
                                    label: Text(
                                  'تعديل',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                                DataColumn(
                                    label: Text(
                                  'حذف',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                              ],
                              rows: studentsGListObject.map((row) {
                                return DataRow(
                                    color: MaterialStateColor.resolveWith(
                                        (states) => Colors.grey),
                                    cells: [
                                      DataCell(Text(row['fullName'])),
                                      DataCell(Text(row['phone'].toString())),
                                      DataCell(IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ModifyStudentsG17()),
                                          );
                                        },
                                      )),
                                      DataCell(IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      )),
                                    ]);
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddStudentsG17()),
                );
              },
            ),
          ),
        ])),
      ),
    );
  }

  Future getStudentsDetailsList() async {
    final snapshot = await collectionReference.get();
    studentsGListObject = snapshot.docs;

    print('Snapshot = ${snapshot.size}');

    setState(() {
      studentsGListObject = snapshot.docs;
      if (studentsGListObject.isNotEmpty) {
        print('USERLIST IS NOT EMPTY');
      } else {
        print('user is empty');
      }
    });
  }
}
