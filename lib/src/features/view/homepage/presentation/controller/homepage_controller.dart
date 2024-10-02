import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shebeauty_provider/src/core/model/dropdown_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/appointment_slot_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/experts_list_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/order_details_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/promotion_banner.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/service_list_model.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/time_slot_model.dart';

import '../../../../../core/di/app_component.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/get_all_product_model.dart';
import '../../data/model/review_model.dart';
import '../../domain/repository/get_all_product_repository.dart';
import '../../domain/usecase/get_all_product_pass_usecase.dart';

class HomepageController extends GetxController {
  var searchController = TextEditingController().obs;
  var subCategorySearchController = TextEditingController().obs;
  var bodyPartSearchController = TextEditingController().obs;
  var selectedValue = false.obs;
  var clickedSubCategory = false.obs;
  var clickedBodyPart = false.obs;
  var gender = 0.obs;
  var genderForAddServices = "".obs;
  var productQuantity = 1.obs;
  var serviceQuantity = 1.obs;
  var isLoading = false.obs;
  var isLoadingOrderList = false.obs;
  var isLoadingOrderDetails = false.obs;
  var isLoadingServiceProducts = false.obs;
  var isPromotionBannerLoading = false.obs;
  var isReviewModelLoading = false.obs;
  var isLoadingExpertsList = false.obs;
  var isLoadingAppointmentSlot = false.obs;
  var isLoadingTimeSlot = false.obs;
  var getAllProductModel = GetAllProductModel().obs;
  var serviceProductModel = ServiceModel().obs;
  var promotionBannerModel = PromotionBannerModel().obs;
  var reviewModel = ReviewModel().obs;
  var expertsListModel = ExpertsListModel().obs;
  var appointmentSlotModel = AppointmentSlotModel().obs;
  var getOrderModel = <AllOrdersModel>[].obs;
  var orderDetailsModel = OrderDetailsModel().obs;
  var timeSlotModel = TimeSlotModel().obs;
  var allCategories = <Category>[].obs;
  var allSubCategories = <Subcategory>[].obs;
  var allBodyPartCategories =
      <Bodypart>[].obs; // This should be your full list of categories
  var filteredCategories = <Category>[].obs;
  var filteredSubCategories = <Subcategory>[].obs;
  var filteredBodyPartCategories = <Bodypart>[].obs;
  List<DropdownModel> category = [];
  DropdownModel? selectedCategory;
  List<DropdownModel> subCategory = [];
  DropdownModel? selectedSubCategory;
  List<DropdownModel> bodyPart = [];
  DropdownModel? selectedBodyPart;
  List<DropdownModel> cityList = [];
  DropdownModel? selectedCity;
  List<DropdownModel> timeSlotList = [];
  DropdownModel? selectedTimeSlot;
  var locationList = [].obs;
  RxList<String> selectedLocations = <String>[].obs;
  var selectedAppointmentTimeSlot = [].obs;
  Rx<File> pickedImage = File("").obs;
  final ImagePicker pickerSingle = ImagePicker();
  late StreamSubscription<bool> connectivitySubscription;
  List selectedBodyValue = <String>[].obs();
  Future<void> pickImageForCertificate() async {
    print("this is image");
    if (await Permission.storage.request().isGranted) {
      print("this is image");
      XFile? xFile = await pickerSingle.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        pickedImage.value = File(xFile.path);
        print(pickedImage.value);
        update();
      }
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      await Permission.storage.request();
    }
    update();
  }

  void filterCategories() {
    String query = searchController.value.text.toLowerCase();

    if (query.isEmpty) {
      // Show all categories if the search query is empty
      filteredCategories.value = List<Category>.from(allCategories);
    } else {
      // Filter categories based on the search query
      filteredCategories.value = allCategories.where((category) {
        return category.name!
            .toLowerCase()
            .contains(query); // Assuming `name` is the field to search
      }).toList();
    }
  }

  void subCategoryFilterCategories(String s, Category? category) {
    // String query = subCategorySearchController.value.text.toLowerCase();

    if (s.isEmpty) {
      // Show all categories if the search query is empty
      filteredSubCategories.value =
          allSubCategories
              .where((subCategory) =>
          category?.id.toString() ==
              subCategory.categoryId)
              .toList();
    } else {
      // Filter categories based on the search query

      filteredSubCategories.value = allSubCategories.where((subCategory) {
        // Check if the subCategory's categoryId matches the given category's id
        bool isCategoryMatch = category?.id.toString() == subCategory.categoryId;

        // Check if the subCategory's name contains the search string `s` (case-insensitive)
        bool isNameMatch =
        subCategory.name!.toLowerCase().contains(s.toLowerCase());

        // Return true only if both conditions are met
        return isCategoryMatch && isNameMatch;
      }).toList();
    }
  }
  List<String?> filterBodypartsByName(String id) {
    return allBodyPartCategories
        .where((bodypart) => bodypart.subcategoryId == id)
        .map((bodypart) => bodypart.name)
        .toList();
  }
  void bodyPartFilterCategories(String s, Subcategory? subCategory) {
    // String query = bodyPartSearchController.value.text.toLowerCase();

    if (s.isEmpty) {
      // Show all categories if the search query is empty
      filteredBodyPartCategories.value =
          allBodyPartCategories
              .where((bodyPart) =>
          subCategory?.id.toString() ==
              bodyPart.subcategoryId)
              .toList();
    } else {
      // Filter categories based on the search query

      filteredBodyPartCategories.value = allBodyPartCategories.where((bodypart) {
        // Check if the subCategory's categoryId matches the given category's id
        bool isCategoryMatch = subCategory?.id.toString() == bodypart.subcategoryId;

        // Check if the subCategory's name contains the search string `s` (case-insensitive)
        bool isNameMatch =
        bodypart.name!.toLowerCase().contains(s.toLowerCase());

        // Return true only if both conditions are met
        return isCategoryMatch && isNameMatch;
      }).toList();
    }
  }

  @override
  void onClose() {
    searchController.value.dispose();
    subCategorySearchController.value.dispose();
    bodyPartSearchController.value.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    getAllProductFuction();
    getOrdersFuction();
    serviceProductFunction();
    expertsListFunction();
    timeSlotFunction();
    appointmentSlotFunction(id: "1");
    promotionBannerFunction();
    reviewFunction();
    filteredCategories.value = List<Category>.from(allCategories);
    filteredSubCategories.value = List<Subcategory>.from(allSubCategories);
    filteredBodyPartCategories.value =
        List<Bodypart>.from(allBodyPartCategories);
    super.onInit();
  }

  getAllProductFuction() async {
    try {
      isLoading.value = true;
      GetAllProductPassUseCase getAllProductPassUseCase =
          GetAllProductPassUseCase(locator<GetAllProductRepository>());
      category.clear();
      category.add(DropdownModel(0, "Select category"));
      subCategory.clear();
      subCategory.add(DropdownModel(0, "Select sub category"));
      bodyPart.clear();
      bodyPart.add(DropdownModel(0, "Select body part"));
      cityList.clear();
      cityList.add(DropdownModel(0, "Select city"));
      var response = await getAllProductPassUseCase();
      print(response?.data);
      if (response?.data != null) {
        getAllProductModel.value = response?.data ?? GetAllProductModel();

        allCategories.value = getAllProductModel.value.category ?? [];
        allSubCategories.value = getAllProductModel.value.subcategory ?? [];
        allBodyPartCategories.value = getAllProductModel.value.bodypart ?? [];
        filteredCategories.value = List<Category>.from(allCategories);
        filteredSubCategories.value = List<Subcategory>.from(allSubCategories);
        filteredBodyPartCategories.value =
            List<Bodypart>.from(allBodyPartCategories);

        for (var item in getAllProductModel.value.category ?? []) {
          print("this is hot data ${item.name}");
          category.add(
            DropdownModel(item.id, item.name ?? ''),
          );
        }
        for (var item in getAllProductModel.value.subcategory ?? []) {
          print("this is hot data ${item.name}");
          subCategory.add(
            DropdownModel(item.id, item.name ?? ''),
          );
        }
        for (var item in getAllProductModel.value.bodypart ?? []) {
          print("this is hot data ${item.name}");
          bodyPart.add(
            DropdownModel(item.id, item.name ?? ''),
          );
        }
        for (var item in getAllProductModel.value.cities ?? []) {
          print("this is hot data ${item.name}");
          cityList.add(
            DropdownModel(item.id, item.name ?? ''),
          );
        }
        selectedCategory = category.first;
        selectedSubCategory = subCategory.first;
        selectedBodyPart = bodyPart.first;
        selectedCity = cityList.first;
        print("this is not here");
      } else {
        print("this is value");
      }
      update();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
    update();
  }
  subCategoryListFunc(Category item){
  filteredSubCategories.value =
      allSubCategories
          .where((subCategory) =>
      item.id.toString() ==
          subCategory.categoryId)
          .toList();
  clickedSubCategory.value = true;
  update();
}
  void categoryChange(DropdownModel model) {
    selectedCategory = model;
    print("category id ${model.id}");
    update();
  }

  void subCategoryChange(DropdownModel model) {
    selectedSubCategory = model;
    print("sub category id ${model.id}");
    update();
  }

  void bodypartChange(DropdownModel model) {
    selectedBodyPart = model;
    print("body part id ${model.id}");
    update();
  }

  void cityChange(DropdownModel model) {
    selectedCity = model;

    if (model.id != 0) {
      // Filter locations based on the selected city's ID
      locationList.value = getAllProductModel.value.location!
          .where((location) => location.citiesId == model.id.toString())
          .toList();
    }
    print("city id ${model.id} ${locationList.value}");
    update();
  }

  void addLocation(item) {
    print("this is id ${item.id}");
    if (!selectedLocations.contains(item.id.toString())) {
      selectedLocations.add(item.id.toString());
    }
    update();
  }

  void removeLocation(item) {
    selectedLocations.remove(item.id.toString());
    update();
  }

  void addAppointmentSlot(item) {
    print("appointment ${item.id}");
    if (!selectedAppointmentTimeSlot.contains(item)) {
      selectedAppointmentTimeSlot.add(item.id.toString());
    }
    update();
  }

  void removeAppointment(item) {
    print("this is remove id ${item.id}");
    selectedAppointmentTimeSlot.remove(item.id.toString());
    update();
  }

  timeSlotFunction() async {
    try {
      isLoadingTimeSlot.value = true;
      TimeSlotPassUseCase timeSlotPassUseCase =
          TimeSlotPassUseCase(locator<GetAllProductRepository>());
      timeSlotList.clear();
      timeSlotList.add(DropdownModel(0, "Select time slot"));
      var response = await timeSlotPassUseCase();
      print(response?.data);
      if (response?.data != null) {
        timeSlotModel.value = response?.data ?? TimeSlotModel();
        for (var item in timeSlotModel.value.data ?? []) {
          print("this is hot data ${item.title}");
          timeSlotList.add(
            DropdownModel(item.id, item.title ?? ''),
          );
        }
        selectedTimeSlot = timeSlotList.first;
      } else {
        print("this is value");
      }
      update();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingTimeSlot.value = false;
    }
    update();
  }

  void timeSlotChange(DropdownModel model) {
    selectedTimeSlot = model;

    print("timeslot id ${model.id}");
    if (selectedTimeSlot?.id != 0) {
      print("this is timeslot id ${selectedTimeSlot?.id}");
      appointmentSlotFunction(id: selectedTimeSlot?.id.toString() ?? '');
    }
    update();
  }

  serviceProductFunction() async {
    print("this is products11111");
    try {
      isLoadingServiceProducts.value = true;
      ServiceProductsPassUseCase serviceProductsPassUseCase =
          ServiceProductsPassUseCase(locator<GetAllProductRepository>());
      var response = await serviceProductsPassUseCase();
      print(response?.data);
      if (response?.data != null) {
        serviceProductModel.value = response?.data ?? ServiceModel();
        print(
            "service product model ${serviceProductModel.value.data?.first.name}");
      } else {
        print("this is SERVICE PRODUCT");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingServiceProducts.value = false;
    }
  }

  promotionBannerFunction() async {
    print("this is products11111");
    try {
      isPromotionBannerLoading.value = true;
      PromotionBannerPassUseCase promotionBannerPassUseCase =
          PromotionBannerPassUseCase(locator<GetAllProductRepository>());
      var response = await promotionBannerPassUseCase();
      print(response?.data);
      if (response?.data != null) {
        promotionBannerModel.value = response?.data ?? PromotionBannerModel();
        for (var prom in promotionBannerModel.value.data ?? []) {
          print("promotion banner model ${prom.image} ${prom.description}");
        }
      } else {
        print("this is value");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isPromotionBannerLoading.value = false;
    }
  }

  reviewFunction() async {
    print("this is preview");
    try {
      isReviewModelLoading.value = true;
      ReviewPassUseCase promotionBannerPassUseCase =
          ReviewPassUseCase(locator<GetAllProductRepository>());
      var response = await promotionBannerPassUseCase();
      print(response?.data);
      if (response?.data != null) {
        reviewModel.value = response?.data ?? ReviewModel();
        print("review Model ${reviewModel.value.reviews?.first.comment}");
      } else {
        print("this is review");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isReviewModelLoading.value = false;
    }
  }

  expertsListFunction() async {
    print("this is products222222");
    try {
      isLoadingExpertsList.value = true;
      ExpertsListPassUseCase expertsListPassUseCase =
          ExpertsListPassUseCase(locator<GetAllProductRepository>());
      var response = await expertsListPassUseCase();
      print(response?.data);
      if (response?.data != null) {
        expertsListModel.value = response?.data ?? ExpertsListModel();
        print("experts List model ${expertsListModel.value.data?.first.name}");
      } else {
        print("this is value");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingExpertsList.value = false;
    }
  }

  appointmentSlotFunction({required String id}) async {
    print("this is products333333 $id");
    try {
      isLoadingAppointmentSlot.value = true;
      AppointmentSlotPassUseCase appointmentSlotPassUseCase =
          AppointmentSlotPassUseCase(locator<GetAllProductRepository>());
      var response = await appointmentSlotPassUseCase(id: id);
      print(response?.data);
      if (response?.data != null) {
        appointmentSlotModel.value = response?.data ?? AppointmentSlotModel();
        print(
            "experts List model ${appointmentSlotModel.value.data?.first.time}");
      } else {
        appointmentSlotModel.value.data?.clear();
        print("this is error portion");
      }
    } catch (e) {
      print("this is error portion");
      print(e.toString());
    } finally {
      isLoadingAppointmentSlot.value = false;
    }
    update();
  }

  getOrdersFuction() async {
    print("this is Order List");
    // try {
    // isLoadingOrderList.value = true;
    GetOrdersPassUseCase getOrdersPassUseCase =
        GetOrdersPassUseCase(locator<GetAllProductRepository>());
    var response = await getOrdersPassUseCase();
    print(response?.data);
    if (response?.data != null) {
      List<AllOrdersModel> dataList = response?.data as List<AllOrdersModel>;
      getOrderModel.clear();
      getOrderModel.addAll(dataList);
      print("this is Order List");
    } else {
      print("this is value");
    }
    isLoadingOrderList.value = false;
    // } catch (e) {
    //   print(e.toString());
    // } finally {
    //   isLoadingOrderList.value = false;
    // }
  }

  orderDetailsFunction({int? id}) async {
    print("this is Order List");
    try {
      isLoadingOrderDetails.value = true;
      OrderDetailsPassUseCase orderDetailsPassUseCase =
          OrderDetailsPassUseCase(locator<GetAllProductRepository>());
      var response = await orderDetailsPassUseCase(id: id.toString());
      print(response?.data);
      if (response?.data != null) {
        orderDetailsModel.value = response?.data ?? OrderDetailsModel();
        print("this is Order details data");
      } else {
        print("this is value");
      }
      isLoadingOrderDetails.value = false;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingOrderDetails.value = false;
    }
  }

}
