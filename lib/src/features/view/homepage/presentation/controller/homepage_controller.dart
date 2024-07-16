import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController{
  var searchController = TextEditingController().obs;
  var selectedValue = false.obs;

  final List<Map<String, String>> cardList = [
    {
      'image': 'https://i.pinimg.com/550x/92/dc/1b/92dc1b3063e2cd03df8c48437b7a2e4e.jpg',
      'name': 'John Doe',
      'description': 'This is the first card description'
    },
    {
      'image': 'https://i.pinimg.com/550x/92/dc/1b/92dc1b3063e2cd03df8c48437b7a2e4e.jpg',
      'name': 'Jane Smith',
      'description': 'This is the second card description'
    },
    {
      'image': 'https://i.pinimg.com/550x/92/dc/1b/92dc1b3063e2cd03df8c48437b7a2e4e.jpg',
      'name': 'Bob Johnson',
      'description': 'This is the third card description'
    },
  ];
}