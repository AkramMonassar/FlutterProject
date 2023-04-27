import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/add_Users.dart';
import 'package:firebase_demo/data/user_response.dart';
import 'package:firebase_demo/modify_User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/user_model.dart';

class ReadDatafromFirbase extends StatefulWidget {
  const ReadDatafromFirbase({Key? key}) : super(key: key);

  @override
  State<ReadDatafromFirbase> createState() => _ReadDatafromFirbaseState();
}

class _ReadDatafromFirbaseState extends State<ReadDatafromFirbase> {
  List userListObject = [];
  // late QuerySnapshot snap;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  //  final db=FirebaseFirestore.instance;

  late String birthDateString;
  late String ageDataString;
  late DateTime birthDate;
  late int ageInt;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUsersDetailsList();

  }

  @override
  Widget build(BuildContext context) {
    getUsersDetailsList();

    return Scaffold(
      appBar: AppBar(
        title: Text('All User '),
      ),
      body: SingleChildScrollView(
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
                  child: Text('Error Happen ${snapshot.hasError}'),
                );
              }
              print("snapshot in streamBilder : ${snapshot.hasData}");

              return DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Modify')),
                  DataColumn(label: Text('Delete')),
                ],
                rows: userListObject.map((row) {
                  return DataRow(cells: [
                    DataCell(Text(row['name'])),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.edit,
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ModifyUser()),
                        );
                      },
                    )),
                    DataCell(IconButton(
                      icon: Icon(
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUser()),
          );
        },
      ),
    );
  }

  Future getUsersDetailsList() async {
    final snapshot = await collectionReference.get();
    userListObject = snapshot.docs;
    // userListObject.forEach((doc){
    //   print(doc.id);
    //   print(doc['name']);
    // });

    print("birthDate after convert : ${birthDate}");

    print('Snapshot = ${snapshot.size}');
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // String n="اكرم";
    //
    //   QuerySnapshot sn = await firestore
    //       .collection('users')
    //       .where('name', isEqualTo: 'اكرم')
    //       .get();
    // sn.docs.forEach((doc) {
    //   print("data to :${doc.data()}");
    // });

    setState(() {
      userListObject = snapshot.docs;
      if (userListObject.isNotEmpty) {
        print('USERLIST IS NOT EMPTY');
      } else {
        print('user is empty');
      }
    });
  }
}
