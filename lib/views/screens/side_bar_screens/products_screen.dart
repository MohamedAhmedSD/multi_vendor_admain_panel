import 'package:flutter/material.dart';

import 'widgets/row_headers.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  // static const String productsRoute = "/productsScreen";
  static const String route = "/productsScreen";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              "Manage Products",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          //? add header row inside one main row
          Row(
            children: [
              RowHeadersWidget(text: "IMAGE", flex: 1),
              RowHeadersWidget(text: "FULL NAME", flex: 3),
              RowHeadersWidget(text: "PRICE", flex: 2),
              RowHeadersWidget(text: "QUANTITY", flex: 2),
              RowHeadersWidget(text: "ACTION", flex: 1),
              RowHeadersWidget(text: "VIEW MORE ", flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
