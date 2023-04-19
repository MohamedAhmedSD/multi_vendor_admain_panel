import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});
  //! static const String uploadBannersRoute = "/uploadBannersScreen";
  static const String route = "/uploadBannersScreen";

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  //! make function to pickImage, you can upload any file type
  dynamic _image;
  //? get fill name
  String? fileName; //* ? => may not picked any file
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    //! files should be under condition stmt
    if (result != null) {
      setState(() {
        //! use dynamic variable above
        //* we use _image => on our way to display image or not
        _image = result.files.first.bytes;

        //! get file name
        fileName = result.files.first.name;
      });
    }
  }

  //! upload to storage
  //! make an object from firebase storage on upload banners page
  final FirebaseStorage _storage = FirebaseStorage.instance;

  //? then create function to upload image into storage
  _uploadBannersToStorage(dynamic image) async {
    //* create folder then image path we get it from fileName
    Reference ref = _storage.ref().child("Banners").child(fileName!);
    //! pass it into storage
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    //! now we need get its url
    String downloadUrl = await snapshot.ref.getDownloadURL();
    //! return url
    return downloadUrl;
  }

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
                      child: _image != null
                          ? Image.memory(
                              _image,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text("Banners"),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade900),
                    onPressed: () {
                      //*
                      pickImage();
                    },
                    child: Text("Upload Image"),
                  ),
                ],
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
