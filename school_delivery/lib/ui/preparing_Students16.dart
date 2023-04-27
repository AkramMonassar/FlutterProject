import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getStudentsDetailsList();
  }

  @override
  Widget build(BuildContext context) {
    getStudentsDetailsList();

    return SafeArea(
      child: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: const Color(0xffecefe4), // make the Scaffold background transparent
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
                            print("snapshot in streamBuilder : ${snapshot.hasData}");

                            return DataTable(
                              columns: const [
                                DataColumn(label: Text('الاسم',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),),),
                                DataColumn(label: Text('رقم الهاتف',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),)),
                                DataColumn(label: Text('تعديل',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),)),
                                DataColumn(label: Text('حذف',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),)),
                              ],
                              rows: studentsGListObject.map((row) {
                                return DataRow(
                                    color: MaterialStateColor.resolveWith((states) => Colors.grey),
                                    cells: [
                                      DataCell(Text(row['fullName'])),
                                      DataCell(Text(row['phone'].toString())),
                                      DataCell(IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ModifyStudentsG17()),
                                          );
                                        },
                                      )),
                                      DataCell(IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: (){

                                        },
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
        ],
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
