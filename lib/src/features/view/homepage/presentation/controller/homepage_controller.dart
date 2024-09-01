import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty_provider/src/features/view/homepage/data/model/order_details_model.dart';

import '../../../../../core/di/app_component.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/get_all_product_model.dart';
import '../../domain/repository/get_all_product_repository.dart';
import '../../domain/usecase/experts_create_pass_usecase.dart';

class HomepageController extends GetxController{
  var searchController = TextEditingController().obs;
  var selectedValue = false.obs;
  var gender = 0.obs;
  var productQuantity = 1.obs;
  var serviceQuantity = 1.obs;
  var isLoading = false.obs;
  var isLoadingOrderList = false.obs;
  var isLoadingOrderDetails = false.obs;
  var getAllProductModel = GetAllProductModel().obs;
  var getOrderModel = <AllOrdersModel>[].obs;
  var orderDetailsModel = OrderDetailsModel().obs;
  @override
  void onInit() {
    getAllProductFuction();
    getOrdersFuction();
    super.onInit();
  }
  getAllProductFuction() async {
      try {
        isLoading.value = true;
        GetAllProductPassUseCase getAllProductPassUseCase =
        GetAllProductPassUseCase(locator<GetAllProductRepository>());
        var response = await getAllProductPassUseCase();
        print(response?.data);
        if (response?.data != null){
          getAllProductModel.value = response?.data ?? GetAllProductModel();
          print("this is not here");
        }else{
          print("this is value");
        }
      } catch (e) {
        print(e.toString());

      }finally{
        isLoading.value = false;
      }
  }
  getOrdersFuction() async {
    print("this is Order List");
      try {
        isLoadingOrderList.value = true;
        GetOrdersPassUseCase getOrdersPassUseCase =
        GetOrdersPassUseCase(locator<GetAllProductRepository>());
        var response = await getOrdersPassUseCase();
        print(response?.data);
        if (response?.data != null){
          List<AllOrdersModel> dataList = response?.data as List<AllOrdersModel>;
          getOrderModel.clear();
          getOrderModel.addAll(dataList);
          print("this is Order List");
        }else{
          print("this is value");
        }
        isLoadingOrderList.value = false;
      } catch (e) {
        print(e.toString());

      }finally{
        isLoadingOrderList.value = false;
      }
  }
  orderDetailsFunction({int? id}) async {
    print("this is Order List");
      try {
        isLoadingOrderDetails.value = true;
        OrderDetailsPassUseCase orderDetailsPassUseCase =
        OrderDetailsPassUseCase(locator<GetAllProductRepository>());
        var response = await orderDetailsPassUseCase(id: id.toString());
        print(response?.data);
        if (response?.data != null){
          orderDetailsModel.value = response?.data ?? OrderDetailsModel();
          print("this is Order details data");
        }else{
          print("this is value");
        }
        isLoadingOrderDetails.value = false;
      } catch (e) {
        print(e.toString());

      }finally{
        isLoadingOrderDetails.value = false;
      }
  }
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