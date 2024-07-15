import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  var ownerNameController = TextEditingController().obs;
  var mobileNumberController = TextEditingController().obs;
  var ownerNIDController = TextEditingController().obs;
  var tradeLicenseController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var storeNameController = TextEditingController().obs;
  var selectedValue = false.obs;
  var tradeLicenseVisility = false.obs;
}
