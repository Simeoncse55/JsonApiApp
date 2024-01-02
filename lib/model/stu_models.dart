// class MyStudents {
//   List<Students>? students;
//
//   MyStudents({this.students});
//
//   MyStudents.fromJson(Map<String, dynamic> json) {
//     if (json['students'] != null) {
//       students = <Students>[];
//       json['students'].forEach((v) {
//         students!.add(Students.fromJson(v));
//       });
//     }
//   }
// }

class Students {
  int? id;
  String? name;
  String? college;
  String? imageUrl;

  Students({this.id, this.name, this.college, this.imageUrl});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    college = json['college'];
    imageUrl = json['image_url'];
  }
}
