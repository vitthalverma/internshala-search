// main.dart
// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:internshala_search/core/filter_methods.dart';
import 'package:internshala_search/presentation/screens/filter_screen.dart';
import 'package:internshala_search/presentation/widgets/filter_button.dart';
import 'package:internshala_search/presentation/widgets/internship_card.dart';
import 'package:internshala_search/presentation/widgets/promo_card.dart';
import 'package:internshala_search/presentation/widgets/shimmer_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/intern_service.dart';
import '../../models/internship_model.dart';

class InternshipListScreen extends StatefulWidget {
  const InternshipListScreen({super.key});

  @override
  _InternshipListScreenState createState() => _InternshipListScreenState();
}

class _InternshipListScreenState extends State<InternshipListScreen> {
  late Future<List<Internship>> futureInternships;
  int totalInternshipsCount = 0;
  List<String> selectedDurations = [];
  List<String> selectedLocations = [];
  List<String> selectedProfiles = [];

  @override
  void initState() {
    super.initState();
    futureInternships = InternshipService().fetchInternships();
  }

  void clearFilter(String filter, String type) {
    setState(() {
      if (type == 'duration') {
        selectedDurations.remove(filter);
      } else if (type == 'location') {
        selectedLocations.remove(filter);
      } else if (type == 'profile') {
        selectedProfiles.remove(filter);
      }
    });
  }

  List<Widget> buildActiveFilters() {
    List<Widget> activeFilters = [];

    if (selectedDurations.isNotEmpty) {
      activeFilters.addAll(selectedDurations.map((duration) => Chip(
            label: Text(duration,
                style: TextStyle(fontSize: 14.sp, color: Colors.black87)),
            onDeleted: () => clearFilter(duration, 'duration'),
            deleteIconColor: Colors.grey.shade500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
              side: BorderSide(color: Colors.grey.shade400),
            ),
          )));
    }

    if (selectedLocations.isNotEmpty) {
      activeFilters.addAll(selectedLocations.map((location) => Chip(
            label: Text(
              location,
              style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            ),
            deleteIconColor: Colors.grey.shade500,
            onDeleted: () => clearFilter(location, 'location'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
              side: BorderSide(color: Colors.grey.shade400),
            ),
          )));
    }

    if (selectedProfiles.isNotEmpty) {
      activeFilters.addAll(selectedProfiles.map((profile) => Chip(
            label: Text(profile,
                style: TextStyle(fontSize: 14.sp, color: Colors.black87)),
            onDeleted: () => clearFilter(profile, 'profile'),
            deleteIconColor: Colors.grey.shade500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
              side: BorderSide(color: Colors.grey.shade400),
            ),
          )));
    }

    return activeFilters;
  }

  bool hasActiveFilters() {
    return selectedDurations.isNotEmpty ||
        selectedLocations.isNotEmpty ||
        selectedProfiles.isNotEmpty;
  }

  int getSelectedFilterCount() {
    return selectedDurations.length +
        selectedLocations.length +
        selectedProfiles.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Internships',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        leading: const Icon(Icons.menu_rounded),
        titleSpacing: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: const Icon(Icons.search_rounded),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(11.h),
          child: FutureBuilder<List<Internship>>(
            future: futureInternships,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade100,
                  child:
                      Container(width: 20.w, height: 2.h, color: Colors.white),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Internships Found'));
              } else {
                List<Internship> filteredInternships =
                    FilterMethods().filterInternships(
                  snapshot.data!,
                  selectedDurations,
                  selectedLocations,
                  selectedProfiles,
                );
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FilterButton(
                            showFunnel: !hasActiveFilters(),
                            filterCount: getSelectedFilterCount(),
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FilterScreen()),
                              );

                              if (result != null) {
                                print(result);
                                setState(() {
                                  selectedDurations = result['durations'];
                                  selectedLocations = result['locations'];
                                  selectedProfiles = result['profiles'];
                                });
                              }
                            },
                          ),
                          SizedBox(width: 1.w),
                          if (hasActiveFilters())
                            Expanded(
                              child: SizedBox(
                                height: 5.h,
                                width: double.infinity,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: buildActiveFilters(),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      '${filteredInternships.length} total internships',
                      style: TextStyle(
                          fontSize: 14.5.sp, color: Colors.grey.shade600),
                    ),
                    SizedBox(height: 2.h),
                  ],
                );
              }
            },
          ),
        ),
      ),
      body: FutureBuilder<List<Internship>>(
        future: futureInternships,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade100,
                    child: const ShimmerCard(),
                  );
                }));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Internships Found'));
          } else {
            List<Internship> filteredInternships =
                FilterMethods().filterInternships(
              snapshot.data!,
              selectedDurations,
              selectedLocations,
              selectedProfiles,
            );

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: PromoCard(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: filteredInternships.length,
                    (context, index) {
                      Internship internship = filteredInternships[index];
                      String postedTime = InternshipService()
                          .calculateTimeDifference(internship.postedOn);
                      return InternshipCard(
                        startDate: internship.startDate,
                        title: internship.title,
                        companyName: internship.id == 65522
                            ? 'Alkymia Tech Private Limited Testing'
                            : internship.companyName,
                        duration: internship.duration,
                        stipend: internship.stipend.salary,
                        location: internship.locationNames.join(', '),
                        postedTime: postedTime,
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
