import 'package:flutter/material.dart';

class BottomSheetApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file,Colors.indigo,"Document"),
                  const SizedBox(width: 40,),
                  iconCreation(Icons.camera_alt,Colors.pink,"Camera"),
                  const SizedBox(width: 40,),
                  iconCreation(Icons.insert_photo,Colors.purple,"Gallery"),
                ],
              ),
              const SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset,Colors.orange,"Audio"),
                  const SizedBox(width: 40,),
                  iconCreation(Icons.location_pin,Colors.teal,"Location"),
                  const SizedBox(width: 40,),
                  iconCreation(Icons.person,Colors.blue,"Contact"),
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }

}

Widget iconCreation(IconData icon,Color color,String text) {
  return InkWell(
    onTap: (){print(text);},
    child: Column(
      children:  [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5.0,),
        Text(text),
      ],
    ),
  );

}



