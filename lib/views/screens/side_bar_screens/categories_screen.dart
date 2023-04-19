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
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          //! banner && 2 buttons
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        border: Border.all(color: Colors.grey.shade800),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //! display picked image
                      //! we use image.memory() => take bytes
                      //? restart app if not work
                      child: Center(
                        child: Text("Category"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade900),
                    onPressed: () {},
                    child: Text("Upload Image"),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              //? add TFF wrap under => flexible => sizedbox
              Flexible(
                child: SizedBox(
                  width: 180,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter Category Name",
                        hintText: "Enter Category Name,"),
                  ),
                ),
              ),
              //! buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade900),
                onPressed: () {
                  //! upload to cloud which automaticlly upload first to storage
                },
                child: Text("Save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
