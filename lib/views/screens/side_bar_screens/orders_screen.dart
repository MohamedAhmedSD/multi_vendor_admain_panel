import 'package:flutter/material.dart';

import 'widgets/row_headers.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  // static const String ordersRoute = "/ordersScreen";
  static const String route = "/ordersScreen";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              "Manage Orders",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          //? add header row inside one main row
          Row(
            children: [
              RowHeadersWidget(text: "IMAGE", flex: 1),
              RowHeadersWidget(text: "FULL NAME", flex: 3),
              RowHeadersWidget(text: "CITY", flex: 2),
              RowHeadersWidget(text: "STATE", flex: 2),
              RowHeadersWidget(text: "ACTION", flex: 1),
              RowHeadersWidget(text: "VIEW MORE ", flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
