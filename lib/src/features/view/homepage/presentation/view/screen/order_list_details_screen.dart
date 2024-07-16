import 'package:flutter/material.dart';
import 'package:shebeauty_provider/src/features/widgets/common_appbar/common_appbar.dart';

import '../widget/orderList_home_widget.dart';

class OrderListDetailsScreen extends StatelessWidget {
  const OrderListDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonCustomAppBar(appbarTitle: "Order"),
      body: OrderlistHomeWidget(scrollDirection: Axis.vertical),
    );
  }
}
