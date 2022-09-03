import 'package:mycourse_app/data/course_model.dart';

import 'meta_data.dart';


class CoursesResponse{
  MetaData? metaData;
  List<Course>? data=[];
  CoursesResponse();

  factory CoursesResponse.fromJson(Map<String,dynamic> json)
  {
    CoursesResponse coursesResponse=CoursesResponse();
    coursesResponse.metaData=MetaData.fromJson(json['metadata']);
    print("Meta Data from Courses_Response.fromJson :${json['metadata']}");

    for(var c in json['record'] )
      {
        Course? temp=Course.fromJson(c);
        coursesResponse.data!.add(temp);
        print("item of list from data from Courses_Response.fromJson :${c['image']}");
      }

    print("Courses_Response :${coursesResponse}");
    return coursesResponse;
  }

}