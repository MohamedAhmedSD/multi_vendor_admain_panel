import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  // static const String uploadBannersRoute = "/uploadBannersScreen";
  static const String route = "/uploadBannersScreen";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              "Banners",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          //! banner && 2 buttons
          Divider(
            color: Colors.grey,
          ),
          Row(
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
                  child: Center(
                    child: Text("Babbers"),
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
              SizedBox(
                width: 30,
              ),
              //! buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade900),
                onPressed: () {},
                child: Text("Save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
