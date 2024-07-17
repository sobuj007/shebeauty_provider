import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';

import '../widget/orderList_home_widget.dart';

class OrderListFullScreen extends StatelessWidget {
  final String from;
  const OrderListFullScreen({super.key, required this.from});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: from == 'parentScreen' ? null : const CommonCustomAppBar(appbarTitle: "Order"),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: OrderlistHomeWidget(
          scrollDirection: Axis.vertical,
          height: MediaQuery.of(context).size.height,
          from: "fromOrderlistFull",
        ),
      ),
    );
  }
}
