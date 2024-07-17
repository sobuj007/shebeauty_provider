import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
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
  var color = [
    AppColors.grey,
    Colors.red,
    Colors.purpleAccent,
    Colors.red.withOpacity(0.6),
  ];
}