import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'web mobril',
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: false),
      debugShowCheckedModeBanner: false,
    );
  }



}

