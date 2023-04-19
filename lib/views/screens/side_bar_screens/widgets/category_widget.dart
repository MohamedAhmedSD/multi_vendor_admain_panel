import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//! we need use on real time data
//! https://firebase.flutter.dev/docs/firestore/usage => Realtime changes#

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  final Stream<QuerySnapshot> _categoriesStream =
      FirebaseFirestore.instance.collection('categories').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _categoriesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          // return Text("Loading");
          return Center(
            child: CircularProgressIndicator(
              color: Colors.cyan,
            ),
          );
        }
        //! how data display
        //? change them to use gridview.builder
        // return ListView(
        //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //     Map<String, dynamic> data =
        //         document.data()! as Map<String, dynamic>;
        //     return ListTile(
        //       title: Text(data['full_name']),
        //       subtitle: Text(data['company']),
        //     );
        //   }).toList(),
        // );

        return GridView.builder(
            //! without use => shrinkWrap: true, == no thing display on screen
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemCount: snapshot.data!.size, //! look we use size not lenght
            itemBuilder: (context, index) {
              //! we enter docs by snapshot then
              //* now we able access them by its index
              final categoryData = snapshot.data!.docs[index];
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      categoryData["image"],
                    ),
                  ),
                  //? title
                  Text(
                    categoryData["categoryName"],
                  ),
                ],
              );
            });
      },
    );
  }
}
