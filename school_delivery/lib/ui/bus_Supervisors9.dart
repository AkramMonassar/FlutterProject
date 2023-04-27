import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_bus_supervisor_account12.dart';
import 'modify_bus_supervisor_account12.dart';


class BusSupervisors9 extends StatefulWidget {
  const BusSupervisors9({Key? key}) : super(key: key);

  @override
  State<BusSupervisors9> createState() => _BusSupervisors9();
}

class _BusSupervisors9 extends State<BusSupervisors9> {
  List SupervisorListObject = [];
  // late QuerySnapshot snap;
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('Supervisor');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getSupervisorDetailsList();
  }

  @override
  Widget build(BuildContext context) {
    getSupervisorDetailsList();

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
                              rows: SupervisorListObject.map((row) {
                                return DataRow(
                                    color: MaterialStateColor.resolveWith((states) => Colors.grey),
                                    cells: [
                                      DataCell(Text(row['name'])),
                                      DataCell(Text(row['phone'].toString())),
                                      DataCell(IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ModifyBusSupervisor12()),
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
                  MaterialPageRoute(builder: (context) => AddBusSupervisor12()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future getSupervisorDetailsList() async {
    final snapshot = await collectionReference.get();
    SupervisorListObject = snapshot.docs;

    print('Snapshot = ${snapshot.size}');

    setState(() {
      SupervisorListObject = snapshot.docs;
      if (SupervisorListObject.isNotEmpty) {
        print('USERLIST IS NOT EMPTY');
      } else {
        print('user is empty');
      }
    });
  }
}
