import 'package:flutter/material.dart';
import 'package:mycourse_app/data/course_api.dart';
import '../data/course_model.dart';
enum ListScreenState{initial,loading,loaded,error}
class CoursesListProviders with ChangeNotifier{

  ListScreenState state=ListScreenState.initial;

  List<Course>? coursesList;

  ApiResult? apiResult;

  String? errorMessage;



  getCourses() async{
    apiResult=await CourseAPI().getCourses();

    if(!apiResult!.hasError!)
      {
        coursesList=apiResult!.data;
        setState(ListScreenState.loaded);
      }else {
      errorMessage=apiResult!.failure!.message;
      setState(ListScreenState.error);
    }
  }

  setState(state)
  {
    this.state=state;
    notifyListeners();
  }

}