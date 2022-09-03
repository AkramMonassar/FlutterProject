
import 'package:flutter/material.dart';
import 'package:mycourse_app/data/course_api.dart';
import 'package:mycourse_app/ui/list_courses.dart';
import 'data/course_model.dart';

void main() {
  runApp(MyApp());
  CourseAPI().getCourses().then((value){
    print('value from main function :$value ');
  }).catchError(
      (err){
        print('error from main :$err');
      }
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Course> course=[];

  @override
  void initState() {
    super.initState();
    CourseAPI().getCourses().then((value)
            {
              setState((){
                course=value;
                if(value.isEmpty==true)
                  {
                    print('value is empty ............');
                  }else{
                  print("Value in main :${value}");
                  print("length of Value in main :${value.length}");
                }

              });
              print("Value in2 main :${value}");
            }
    );
    print("length of Course in main :${course.length}");
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dev School',
        theme: ThemeData(
          fontFamily: 'Cairo',
          primarySwatch: Colors.blue,
        ),
        home: CoursesList(course)
    );
  }
}