import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../wallet/presentation/view/history_screen.dart';
import '../../../wallet/presentation/view/today_screen.dart';
import '../../../wallet/presentation/view/upcomming_screen.dart';
import 'day_sceen.dart';

class MySlotsScreen extends StatelessWidget {
  const MySlotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonCustomAppBar(appbarTitle: "My Slots", onTap: (){},),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: DefaultTabController(
              length: 7,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: AppColors.grey,
                    labelColor: Colors.black,
                    tabAlignment: TabAlignment.start,

                    tabs: [
                      Tab(text: "Saturday"),
                      Tab(text: "Sunday"),
                      Tab(text: "Monday"),
                      Tab(text: "Tuesday"),
                      Tab(text: "Wednesday"),
                      Tab(text: "Thursday"),
                      Tab(text: "Friday"),
                    ],
                  ),

                  Expanded(
                    child: TabBarView(
                      children: [
                        DaySceen(),
                        DaySceen(),
                        DaySceen(),
                        DaySceen(),
                        DaySceen(),
                        DaySceen(),
                        DaySceen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
