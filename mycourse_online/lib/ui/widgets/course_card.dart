import 'package:flutter/material.dart';
import 'package:mycourse_app/data/course_model.dart';
import 'package:mycourse_app/ui/course_details.dart';

class CourseCard extends StatelessWidget {
   Course? _course;

  var result;

  CourseCard({Course? course}) : _course = course;

  @override
  Widget build(BuildContext context) {
    Widget courseCard = _buildCourseCard();

    return GestureDetector(
        onTap: ()async{
       // final result=await Navigator.push(context,
       //        MaterialPageRoute(builder: (context)=>CourseDetails(_course!))
       //
       //      );
          print('Course Title :${_course!.title}');
         Navigator.pushNamed(context,
             CourseDetails.SCREEN_DETIALS_ID,
             arguments: _course);
        },
        child: courseCard);


  }

  Widget _buildCourseCard() {
    Widget cardContent = _buildCourseCardContent(_course!);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: cardContent,
      ),
    );
  }

  Widget _buildCourseCardContent(Course course) {
    Widget courseImage = _buildCourseImage(_course!.image!);
    Widget courseTitle = _buildCourseTitle(_course!.title!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        courseImage,
        courseTitle,
      ],
    );
  }

  Widget _buildCourseImage(String image) {
    image ??= 'https://static.thenounproject.com/png/583402-200.png';
    return Image.network(
      image,
      fit: BoxFit.fitWidth,
      height: 150,
    );
  }

  Widget _buildCourseTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
