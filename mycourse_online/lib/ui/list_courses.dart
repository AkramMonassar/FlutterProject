import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mycourse_app/Providers/courses_list_providers.dart';
import 'package:mycourse_app/data/course_model.dart';
import 'package:mycourse_app/ui/widgets/course_card.dart';
import 'package:mycourse_app/ui/widgets/error_mssage.dart';
import 'package:provider/provider.dart';

class CoursesList extends StatelessWidget {
  static const String SCREEN_DETAILS_ID='/';
  List<Course>? coursesList;

  CoursesListProviders? coursesListProviders;
  CoursesList();

  @override
  Widget build(BuildContext context) {
    coursesListProviders=Provider.of<CoursesListProviders>(context);

    if(coursesListProviders!.state==ListScreenState.initial)
      {
        coursesListProviders!.getCourses();
        return const Center(
          child: CircularProgressIndicator(),
        );
      }else if(coursesListProviders!.state==ListScreenState.error){
        String message=coursesListProviders!.errorMessage!;
        return ErrorMessageWidget(
          message: message,
        );
    }
    else{
      coursesList=coursesListProviders!.coursesList;
    }


    return _buildCoursesScreen();
  }

  _buildCoursesScreen() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_buildCourseListHeader(), _buildCoursesList()],
        ),
      ),
    );
  }

  // add Header Text And BoxDecoration contain Image background box header
  _buildCourseListHeader() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/header_bg.jpg'),
              fit: BoxFit.cover)),
      child: const Center(
        child: Text(
          'الدورات الحالية',
          style: TextStyle(fontSize: 38, fontFamily: 'Cairo'),
        ),
      ),
    );
  }

  _buildCoursesList() {
    return Expanded(
      child: ListView.builder(
        itemCount: coursesList!.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          return CourseCard(
            course: coursesList![index],
          );
        },
      ),
    );
  }

}
