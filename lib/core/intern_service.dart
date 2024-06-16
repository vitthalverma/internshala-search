import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internshala_search/models/internship_model.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class InternshipService {
  final String apiUrl =
      "https://internshala.com/flutter_hiring/search"; // Replace with your actual API URL

  Future<List<Internship>> fetchInternships() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      InternshipResponse internshipResponse = InternshipResponse.fromJson(body);
      List<Internship> internships = internshipResponse.internshipIds
          .map((id) => internshipResponse.internshipsMeta[id.toString()])
          .where((internship) => internship != null)
          .toList()
          .cast<Internship>();
      return internships;
    } else {
      throw Exception('Failed to load internships');
    }
  }

  String calculateTimeDifference(String oldDateStr) {
    DateFormat format = DateFormat("dd MMM'' yy", "en_US");
    DateTime oldDate = format.parse(oldDateStr);
    Duration difference = DateTime.now().difference(oldDate);
    return timeago.format(DateTime.now().subtract(difference));
  }
}
