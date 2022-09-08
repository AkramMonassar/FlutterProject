import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mycourse_app/data/AppConstants.dart';
import 'package:mycourse_app/data/course_model.dart';
import 'package:mycourse_app/data/courses_response.dart';
import 'package:mycourse_app/data/meta_data.dart';

class Failure {
  String? code;
  String? message;

  Failure(this.code, this.message);
}

class ApiResult {
  bool? hasError;
  dynamic data;
  Failure? failure;
}

class CourseAPI {
  Future<ApiResult> getCourses() async {
    var url = 'https://api.jsonbin.io/v3/b/631146a9e13e6063dc96e523';
    http.Response response;
    CoursesResponse? coursesListResponse;
    var jsonResponse;
    ApiResult result = ApiResult();

    try {
      response = await http.get(Uri.parse(url));

      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        jsonResponse = convert.jsonDecode(response.body);

        coursesListResponse = CoursesResponse.fromJson(jsonResponse);

        result.hasError = false;
        result.data = coursesListResponse.data;
      }
      else {
        MetaData? responseMeta=CoursesResponse().metaData;

        result.hasError=true;
        result.failure=Failure(responseMeta!.id, responseMeta!.name);

      }
    } on
    SocketException {
      result.hasError=true;
      result.failure=Failure(AppConstants.ERROR_NO_CONNECTION_CODE, "Can't connect to Internet");
    } on
    FormatException {
      result.hasError=true;
      result.failure=Failure(AppConstants.ERROR_NO_BODY_PARSING_CODE, "Problem Parsing data from the server");
    } catch (ex) {
      result.hasError=true;
      result.failure=Failure(AppConstants.ERROR_NO_CONNECTION_CODE, ex.toString());
    }
    return result;
  }
}
