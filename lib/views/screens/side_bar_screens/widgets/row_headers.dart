import 'package:flutter/material.dart';

class RowHeadersWidget extends StatelessWidget {
  RowHeadersWidget({
    Key? key,
    required this.text,
    required this.flex,
  }) : super(key: key);
  final String text;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade700,
            ),
            color: Colors.yellow.shade900,
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
