import 'package:internshala_search/models/internship_model.dart';

class FilterMethods {
  late Future<List<Internship>> futureInternships;
  int totalInternshipsCount = 0;
  List<String> selectedDurations = [];
  List<String> selectedLocations = [];
  List<String> selectedProfiles = [];

  List<Internship> filterInternships(List<Internship> internships,
      List<String> durations, List<String> locations, List<String> profiles) {
    return internships.where((internship) {
      final matchesDuration =
          durations.isEmpty || durations.contains(internship.duration);
      final matchesLocation = locations.isEmpty ||
          internship.locationNames
              .any((location) => locations.contains(location));
      final matchesProfile =
          profiles.isEmpty || profiles.contains(internship.profileName);
      return matchesDuration && matchesLocation && matchesProfile;
    }).toList();
  }
}
