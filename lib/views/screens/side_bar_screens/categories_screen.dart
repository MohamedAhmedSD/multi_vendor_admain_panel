import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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

  //? method
  uploadCategory() {
    //! first check validator before upload
    if (_formKey.currentState!.validate()) {
      print("Good Guy");
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
                      //? add validator to it
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Category Name Must Not Be Empty';
                        } else {
                          return null;
                        }
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
            )
          ],
        ),
      ),
    );
  }
}
