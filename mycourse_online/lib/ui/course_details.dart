import 'package:flutter/material.dart';
import 'package:mycourse_app/data/course_model.dart';

class CourseDetails extends StatelessWidget{
  static const String SCREEN_DETIALS_ID='/course_details';

  CourseDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Course;

    if(args==null){
      print('its null');
    }

    return  Scaffold(
      appBar: AppBar(
        title:const Text('Course Details '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(
            child: Text(args.title!)
            // child: Text('This is any Text '),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context,'simple');
              },
              child:const Text('Back'))
        ],
      ),
    );
  }

}