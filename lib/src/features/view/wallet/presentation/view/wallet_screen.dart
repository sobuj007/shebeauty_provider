import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/core/extensions/extensions.dart';
import 'package:shebeauty_provider/src/core/utils/app_colors.dart';
import 'package:shebeauty_provider/src/features/view/wallet/presentation/view/history_screen.dart';
import 'package:shebeauty_provider/src/features/view/wallet/presentation/view/today_screen.dart';
import 'package:shebeauty_provider/src/features/view/wallet/presentation/view/upcomming_screen.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';
import 'package:shebeauty_provider/src/features/widgets/custom_text/custom_text.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonCustomAppBar(appbarTitle: "Wallet", icon: null, showActionButton: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 106,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.deepGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRow(title1: "Earn", title2: "Order", title3: "Pending"),
                    20.ph,
                    CustomRow(title1: "15000.0", title2: "25", title3: "5")
                  ],
                ),
              ),
            ),
            20.ph,
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                     TabBar(
                       dividerColor: Colors.transparent,
                        indicatorColor: Colors.transparent,
                       unselectedLabelColor: AppColors.grey,
                       labelColor: Colors.black,
                        tabs: [
                          Tab(text: "Today"),
                          Tab(text: "Upcoming"),
                          Tab(text: "History"),
                        ],
                      ),

                    Expanded(
                      child: TabBarView(
                        children: [
                          TodayScreen(),
                          UpcommingScreen(),
                          HistoryScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
  Widget CustomRow({required String title1, required String title2, required String title3}){
    return Row(
      children: [
        Expanded(child: CustomText(text: title1, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.25, textAlign: TextAlign.center,textColor: Colors.black,)),
        Expanded(child: CustomText(text: title2, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.25, textAlign: TextAlign.center,textColor: Colors.black,)),
        Expanded(child: CustomText(text: title3, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.25, textAlign: TextAlign.center,textColor: Colors.black,)),
      ],
    );
  }
}
