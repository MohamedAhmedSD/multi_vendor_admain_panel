import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  //! WE need add route here to be able access it from screenSelctor method
  //! not able to nav by this
  // static const String categoriesRoute = "/categoriesScreen";

  //* so try make all screens cary same name of variable with different value
  static const String route = "/categoriesScreen";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text(
          "Cat",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
      ),
    );
  }
}
