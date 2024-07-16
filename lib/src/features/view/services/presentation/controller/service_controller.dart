import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController{
  List<File?> images = <File?>[].obs;
  var nameController = TextEditingController().obs;
  var categoryController = TextEditingController().obs;
  var subCategoryController = TextEditingController().obs;
  var bodyPartController = TextEditingController().obs;
  var servicesPriceController = TextEditingController().obs;
  var withProductPriceController = TextEditingController().obs;
  var maleController = TextEditingController().obs;
  var femaleController = TextEditingController().obs;
  var serviceDescriptionController = TextEditingController(text: 'Lorem ipsum dolor sit amet consectetur. Turpis augue quis eget maecenas in euismod sit. Eget mauris scelerisque risus donec commodo fermentum. Pretium egestas pretium senectus bibendum blandit sed. Diam posuere augue molestie velit aliquam pharetra aliquet.').obs;
}