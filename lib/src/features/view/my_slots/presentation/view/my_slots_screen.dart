import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shebeauty_provider/src/core/di/app_component.dart';
import 'package:shebeauty_provider/src/features/view/homepage/presentation/controller/homepage_controller.dart';
import 'package:shebeauty_provider/src/features/view/my_slots/presentation/controller/my_slot_create_controller.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';

import '../../../../../core/routes/AppRouts.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../widgets/child_preferred_size_tab_bar.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import '../../../wallet/presentation/view/history_screen.dart';
import '../../../wallet/presentation/view/today_screen.dart';
import '../../../wallet/presentation/view/upcomming_screen.dart';
import 'child_step_view.dart';
import 'day_sceen.dart';

class MySlotsScreen extends StatefulWidget {
  const MySlotsScreen({super.key});

  @override
  State<MySlotsScreen> createState() => _MySlotsScreenState();
}

class _MySlotsScreenState extends State<MySlotsScreen> with SingleTickerProviderStateMixin{
  TabController? _childTabController;
  var controller = locator<MySlotCreateController>();
  var homeController = locator<HomepageController>();

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    // Initialize the controller only if data is not null
    if (controller.mySlotListModel.value.data != null) {
      _childTabController = TabController(
        length: controller.mySlotListModel.value.data!.length,
        vsync: this,
        initialIndex: 0, // Set initialIndex to 0 to avoid out-of-range error
      );

      _childTabController?.addListener(() {
        if (!_childTabController!.indexIsChanging) {
          controller.updateChild(_childTabController!.index, _childTabController!.previousIndex).then((value) {
            if (value) {
              setState(() {
                controller.currentChildIndex = _childTabController!.index;
              });
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Reinitialize the TabController if the data length changes
      if (_childTabController == null ||
          _childTabController!.length != (controller.mySlotListModel.value.data?.length ?? 0)) {
        _initController();
      }

      return  DefaultTabController(
        length: controller.mySlotListModel.value.data?.isEmpty ?? false ? 1 : controller.mySlotListModel.value.data?.length ?? 0,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CommonCustomAppBar(
            appbarTitle: "My Slot",
            onTap: () {},
          ),
          body: controller.isLoadingMySlotList.value == true ? Center(
            child: CircularProgressIndicator(),
          ) : controller.mySlotListModel.value.data == null || controller.mySlotListModel.value.data!.isEmpty
              ? const Center(child: CustomText(text: "No Data Found"))  // Show a loader or empty state
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    Get.toNamed(AppRoutes.mySlotsCreateScreen);
                  },
                  child: Container(
                    height: 27,
                    width: 112,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(),
                    ),
                    child: Center(
                        child: CustomText(
                          text: "Add/Delete",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ),
              PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.centerLeft, // Align to the left
                    padding: EdgeInsets.zero, // Remove padding
                    margin: EdgeInsets.zero, // Remove margin
                    child: TabBar(
                      onTap: (d){
                        homeController.appointmentSlotFunction(id: controller.mySlotListModel.value.data?[d].id.toString() ?? '');
                      },
                      controller: _childTabController,
                      indicatorColor: HexColor("979797"),
                      isScrollable: true,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      tabs: controller.mySlotListModel.value.data?.map((child) {
                        return Tab(text: child.title);
                      }).toList() ?? [],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: TabBarView(
                  controller: _childTabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: controller.mySlotListModel.value.data?.map((child) {
                    return  DaySceen(controller: homeController);  // Replace with your actual widgets for each tab
                  }).toList() ?? [],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}