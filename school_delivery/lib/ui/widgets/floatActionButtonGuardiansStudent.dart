import 'package:flutter/material.dart';

import '../add_New_Student17.dart';
import '../notifications_Parent22.dart';


class FloatActionButtonGuardiansStudent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // زر التقرير
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo[300],
          child: const Icon(Icons.report_outlined),
        ),
        Stack(
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsParent22()));
              },
              child: const Icon(Icons.notifications,),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddStudentsG17()),
            );
          },
          backgroundColor: Colors.indigo[300],
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
