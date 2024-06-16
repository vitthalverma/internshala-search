// internship_model.dart

class InternshipResponse {
  final Map<String, Internship> internshipsMeta;
  final List<int> internshipIds;

  InternshipResponse({
    required this.internshipsMeta,
    required this.internshipIds,
  });

  factory InternshipResponse.fromJson(Map<String, dynamic> json) {
    var internshipsMetaJson = json['internships_meta'] as Map<String, dynamic>;
    Map<String, Internship> internshipsMeta =
        internshipsMetaJson.map((key, value) {
      return MapEntry(key, Internship.fromJson(value));
    });

    List<int> internshipIds = List<int>.from(json['internship_ids']);

    return InternshipResponse(
      internshipsMeta: internshipsMeta,
      internshipIds: internshipIds,
    );
  }
}

class Internship {
  final int id;
  final String title;
  final String employmentType;
  final bool workFromHome;
  final String companyName;
  final String companyUrl;
  final bool isPremium;
  final String url;
  final bool isActive;
  final String expiresAt;
  final String profileName;
  final String startDate;
  final String duration;
  final Stipend stipend;
  final String postedOn;
  final List<String> locationNames;
  final String companylogo;

  Internship({
    required this.id,
    required this.title,
    required this.employmentType,
    required this.workFromHome,
    required this.companyName,
    required this.companyUrl,
    required this.isPremium,
    required this.url,
    required this.isActive,
    required this.expiresAt,
    required this.profileName,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.postedOn,
    required this.locationNames,
    required this.companylogo,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      id: json['id'],
      title: json['title'],
      employmentType: json['employment_type'],
      workFromHome: json['work_from_home'],
      companyName: json['company_name'],
      companyUrl: json['company_url'],
      isPremium: json['is_premium'],
      url: json['url'],
      isActive: json['is_active'],
      expiresAt: json['expires_at'],
      profileName: json['profile_name'],
      startDate: json['start_date'],
      duration: json['duration'],
      stipend: Stipend.fromJson(json['stipend']),
      postedOn: json['posted_on'],
      locationNames: List<String>.from(json['location_names']),
      companylogo: json['company_logo'] ?? '',
    );
  }
}

class Stipend {
  final String salary;
  final int salaryValue1;
  final String currency;

  Stipend({
    required this.salary,
    required this.salaryValue1,
    required this.currency,
  });

  factory Stipend.fromJson(Map<String, dynamic> json) {
    return Stipend(
      salary: json['salary'],
      salaryValue1: json['salaryValue1'],
      currency: json['currency'],
    );
  }
}
