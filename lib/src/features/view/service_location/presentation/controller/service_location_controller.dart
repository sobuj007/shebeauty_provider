import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shebeauty_provider/src/core/routes/AppRouts.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';

class ServiceLocationController extends GetxController{
var selectIndex = 100.obs;
var item = [
  {"item": "Badda"},
  {"item": "Mohakhali"},
  {"item": "Farmgate"},
  {"item": "Mirput 1"},
  {"item": "Mirpur 2"},
  {"item": "Mirpur 3"},
  {"item": "Mirpur 4"},
  {"item": "Mirpur 5"},
  {"item": "Uttara Sector 1"},
  {"item": "Airport"},
  {"item": "Bijoy Sharani"},
  {"item": "Shahbag"},
  {"item": "Paltan"},
].obs;
var locations = [].obs;
var selectedlocations = [].obs;
  var color = [
    AppColors.grey,
    Colors.red,
    Colors.purpleAccent,
    Colors.red.withOpacity(0.6),
  ];
//   void removeLocation(String location) async {
//     if (selectedlocations.contains(location)) {
//       selectedlocations.remove(location);
//       await saveSelectedLocations(); // Save changes to SharedPreferences
//     }
//   }
// Future<void> saveSelectedLocations() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
  
//   // Ensure all items in the list are properly encoded as strings
//   List<String> stringList = selectedlocations
//       .map((item) => jsonEncode(item)) // or directly if already a string
//       .cast<String>()
//       .toList();
  
//   await prefs.setStringList('customObjectList', stringList);
// }
void removeLocation(String itemJson) {
  selectedlocations.remove(itemJson);
}
Future<void> saveAndNavigateIfNeeded() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? selectedStringList = prefs.getStringList('customObjectList');
          selectedlocations.value = selectedStringList ?? [];
  // Convert and prepare the list to be saved
  List<String> stringList = selectedlocations.cast<String>().toList();
  
  // Save the list to SharedPreferences
  await prefs.setStringList('customObjectList', stringList);
  
  // Check if the list is not empty
  if (stringList.isNotEmpty) {
    
    Get.toNamed(AppRoutes.selectedServiceLocationScreen);
  }else{
Get.toNamed(AppRoutes.serviceLocationScreen);
  }
}
void toggleSelection( item) {
    if (selectedlocations.contains(item)) {
      selectedlocations.remove(item);
    } else {
      selectedlocations.add(item);
    }
    // saveSelectedLocations(); // Save changes to SharedPreferences
  }
}