import 'package:flutter/material.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/widgets/row_headers.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});
  // static const String vendorsRoute = "/vendorsScreen";
  static const String route = "/vendorsScreen";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              "Vendors",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          //? add header row inside one main row
          Row(
            children: [
              RowHeadersWidget(text: "LOGO", flex: 1),
              RowHeadersWidget(text: "BUSSINESS NAME", flex: 3),
              RowHeadersWidget(text: "CITY", flex: 2),
              RowHeadersWidget(text: "STATE", flex: 2),
              RowHeadersWidget(text: "ACTION", flex: 1),
              RowHeadersWidget(text: "VIEW MORE ", flex: 1),
            ],
          )
        ],
      ),
    );
  }
}
