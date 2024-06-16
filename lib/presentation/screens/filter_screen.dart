import 'package:flutter/material.dart';
import 'package:internshala_search/presentation/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> selectedDurations = [];
  List<String> selectedLocations = [];
  List<String> selectedProfiles = [];

  final List<String> durations = ['2 Months', '3 Months', '5 Months'];
  final List<String> locations = [
    'Munnar',
    'Delhi',
    'Lucknow',
    'Tarn Taran',
    'Gurgaon',
    'Banga (Philippines)'
  ];
  final List<String> profiles = [
    'Data Science',
    'Administration',
    'Android App Development',
    'Product Management',
    'Business Analytics',
  ];

  Widget buildFilterSection(
      String title, List<String> items, List<String> selectedItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: items.map((item) {
            return FilterChip(
              selectedColor: Colors.blue.shade400,
              side: BorderSide(
                color: selectedItems.contains(item)
                    ? Colors.blue.shade400
                    : Colors.grey.shade400,
              ),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
              showCheckmark: false,
              checkmarkColor:
                  selectedItems.contains(item) ? Colors.white : Colors.black,
              label: Text(
                item,
                style: TextStyle(
                  color: selectedItems.contains(item)
                      ? Colors.white
                      : Colors.grey.shade700,
                ),
              ),
              selected: selectedItems.contains(item),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedItems.add(item);
                  } else {
                    selectedItems.remove(item);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: const Text(
          'Filters',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              color: Colors.white,
              width: 43.w,
              height: 5.h,
              ontap: () {
                setState(() {
                  selectedProfiles.clear();
                  selectedDurations.clear();
                  selectedLocations.clear();
                });
              },
              borderRadius: 1.w,
              child: const Text(
                'Clear all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            CustomButton(
              color: const Color.fromARGB(255, 49, 155, 242),
              width: 43.w,
              height: 5.h,
              ontap: () {
                Navigator.pop(context, {
                  'durations': selectedDurations,
                  'locations': selectedLocations,
                  'profiles': selectedProfiles,
                });
              },
              borderRadius: 1.w,
              child: const Text(
                'Apply',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFilterSection('Duration', durations, selectedDurations),
            buildFilterSection('Location', locations, selectedLocations),
            buildFilterSection('Profile', profiles, selectedProfiles),
          ],
        ),
      ),
    );
  }
}
