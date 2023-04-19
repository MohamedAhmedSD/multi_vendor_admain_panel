import 'package:flutter/material.dart';

import 'widgets/row_headers.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});
  // static const String withdrawalRoute = "/withdrawalScreen";
  static const String route = "/withdrawalScreen";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              "Withdrawal",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          //? add header row inside one main row
          Row(
            children: [
              RowHeadersWidget(text: "NAME", flex: 1),
              RowHeadersWidget(text: "AMOUNT", flex: 3),
              RowHeadersWidget(text: "BANK NAME", flex: 2),
              RowHeadersWidget(text: "BANK ACCOUNT", flex: 2),
              RowHeadersWidget(text: "EMAIL", flex: 1),
              RowHeadersWidget(text: "PHONE", flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
