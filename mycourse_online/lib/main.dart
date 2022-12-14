import 'package:flutter/material.dart';
import 'package:mycourse_app/Providers/courses_list_providers.dart';
import 'package:mycourse_app/ui/course_details.dart';
import 'package:mycourse_app/ui/list_courses.dart';
import 'data/course_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => CoursesListProviders(),
    )
  ],child: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Course> course = [];

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
        initialRoute: CoursesList.SCREEN_DETAILS_ID,
        routes: {
          CoursesList.SCREEN_DETAILS_ID:(context)=>CoursesList(),
          CourseDetails.SCREEN_DETIALS_ID:(context)=>CourseDetails(),
        }
        // home: CoursesList()
    );
  }
}
