import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:json_data_getx/model/stu_models.dart';
import 'package:http/http.dart' as http;

class StudentsDetails extends GetxController {
  var isloading = false.obs;

  List<Students> students = List<Students>.empty(growable: true).obs;

  Future<void> fetchStuData() async {
    try {
      isloading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://simeoncse55.github.io/students_json_api/Students.json')!);

      if (response.statusCode == 200) {
        var result = convert.jsonDecode(response.body);
        students.addAll(List<Students>.from(
            result['students'].map((e) => Students.fromJson(e))));
        print("Hii");
      } else {
        throw Exception('Failed to load');
      }
    }

    // catch(e){}

    on Exception catch (_) {
      // make it explicit that this function can throw exceptions
      rethrow;
    } finally {
      isloading(false);
    }
  }
}
