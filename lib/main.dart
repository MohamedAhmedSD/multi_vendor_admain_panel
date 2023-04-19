import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_vendor_admain_panel/views/screens/main_screen.dart';
import 'firebase_options.dart';

//! [10] web admin category
//! switching screen => make screens first
//* flutter_admin_scaffold: ^1.2.0
//* stop analysis_options file
//? flutter_easyloading: ^3.0.5
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
    options: DefaultFirebaseOptions.android,
  );
  //! second but hard way to connect with web
  //! second but hard way to connect with web,
  //! connect its web first
  // options :kIsWeb || Platform.isAndroid? FirebaseOptions(apiKey: apiKey, appId: appId, messagingSenderId: messagingSenderId, projectId: projectId,storageBucket: ):null
  // firebase => project overview => apps =>
  /// settings icon => read code on sdk setup you will find all data about 4:
  /// apiKey
  /// appId
  /// messagingSenderId
  /// projectId
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      //! call easyloading package, then call it at any place you want
      builder: EasyLoading.init(),
    );
  }
}
