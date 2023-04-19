import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_vendor_admain_panel/views/screens/side_bar_screens/widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});
  //! WE need add route here to be able access it from screenSelctor method
  //! not able to nav by this
  // static const String categoriesRoute = "/categoriesScreen";

  //* so try make all screens cary same name of variable with different value
  static const String route = "/categoriesScreen";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  //! now we deal with TFF so we need wrap main column under form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //?
  late String categoryName;
  //? method
  uploadCategory() async {
    //! first check validator before upload
    //* adjust validator

    EasyLoading.show();
    if (_formKey.currentState!.validate()) {
      print("Good Guy");
      String imageUrl = await _uploadCategoryToStorage(_image);
      await _firestore.collection("categories").doc(fileName).set({
        'image': imageUrl,
        'categoryName': categoryName,
      }).whenComplete(() => EasyLoading.dismiss());
      setState(() {
        //!reset image
        _image = null;
        //! reset TFF
        _formKey.currentState!.reset();
      });
    } else {
      print("o Bad Guy");
    }
  }

  //! copy pick image here => not good practise
  dynamic _image;

  //? get fill name
  String? fileName;
  //* ? => may not picked any file

  _pickImage() async {
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

  //* upload to storage method
  final FirebaseStorage _storage = FirebaseStorage.instance;

  _uploadCategoryToStorage(dynamic image) async {
    Reference ref = _storage.ref().child("categoryImages").child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //! connect with cloud
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey, //! if forget it no function from TFF will work
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
                        child: _image != null
                            ? Image.memory(
                                _image,
                                fit: BoxFit.cover,
                              )
                            : Center(
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
                      onPressed: () {
                        _pickImage();
                      },
                      child: Text("Upload Image"),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                //! add TFF wrap under => flexible => sizedbox
                Flexible(
                  child: SizedBox(
                    width: 180,
                    child: TextFormField(
                      //! use onChanged
                      onChanged: (value) {
                        categoryName = value;
                      },
                      //? add validator to it
                      validator: (value) {
                        if (value!.isEmpty) {
                          // return 'Please Category Name Must Not Be Empty';
                        } else {
                          return null;
                        }
                        return null;
                      },
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
                    uploadCategory();
                  },
                  child: Text("Save"),
                ),
              ],
            ),
            //! add dividor
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //! add categories widget
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
