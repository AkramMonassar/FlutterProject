import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:mycourse_app/data/course_model.dart';
import 'package:mycourse_app/data/courses_response.dart';

class CourseAPI {
 Future<List<Course>> getCourses() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =Uri.parse('https://api.jsonbin.io/v3/b/631146a9e13e6063dc96e523');
    // Await the http get response, then decode the json-formatted response.
    http.Response response = await http.get(url);

    CoursesResponse? coursesResponse;
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      coursesResponse=CoursesResponse.fromJson(jsonResponse);
      print("meta_data from course_api from from Source Main:${jsonResponse['meta_data']}");
      print("meta_data from course_api from from CourseResponse :${jsonResponse['meta_data']}");

    } else {
      // print('Request failed with status: ${response.statusCode}.');
    }
    return coursesResponse!.data!;
  }
}
