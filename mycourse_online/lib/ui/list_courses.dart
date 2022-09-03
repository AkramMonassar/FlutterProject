import 'package:flutter/material.dart';
import 'package:mycourse_app/data/course_model.dart';

class CoursesList extends StatelessWidget {
  List<Course>? coursesList;

  CoursesList(this.coursesList);

  @override
  Widget build(BuildContext context) {
    // coursesList = _buildDummyCoursesList();

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
          return GestureDetector(
              onTap: () {
                print('This is Course is :  ${coursesList![index].title}');
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.network(
                        coursesList![index].image!,
                        fit: BoxFit.fitWidth,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          coursesList![index].title!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  //add to list content list.add static
  _buildDummyCoursesList() {
    coursesList!.add(Course(
        id: 100,
        image:
            'https://cdn3.f-cdn.com/contestentries/1112912/26228964/599ac11baba88_thumb900.jpg',
        title: 'Youtube Marketing | التسويق الرقمي',
        description: 'Learn the best practices in Youtube Marketing'));

    coursesList!.add(Course(
        id: 200,
        image:
            'https://hepta-marketing.com/wp-content/uploads/2021/06/44da9d9a3f82f646cb47caaf6e72b094.jpg',
        title: 'Electronic Marketing | التسويق الالكتروني',
        description:
            'التسويق الالكتروني، الدليل الشامل بالتفصيل و خطوه بخطوه'));

    coursesList!.add(Course(
        id: 300,
        image:
            'https://5.imimg.com/data5/QD/VX/MY-61372866/flutter-application-development-500x500.png',
        title:
            'Mobile Development With Flutter | تطوير التطبيقات باستخدام فلاتر',
        description: 'This course is a mobile development With Flutter'));

    coursesList!.add(Course(
        id: 100,
        image:
            'https://mo-helala.com/blog/dart-flutter-pdf-book/dart-flutter-pdf-book.png',
        title: 'Dart Language | لغة دارت',
        description: 'Learn the best practices in Dart Language'));

    coursesList!.add(Course(
        id: 200,
        image: 'https://hackr.io/blog/best-java-courses/thumbnail/large',
        title: 'Introduction to Java | مقدمة فى الجافا',
        description:
            'Description Introduction to Java Description Introduction to Java Description Introduction to Java'));

    return coursesList;
  }
}
