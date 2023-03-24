import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'screens.dart/magazine_details.dart';
import 'dart:ffi';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(NewssApp());
}

class NewssApp extends StatefulWidget {
  const NewssApp({super.key});

  @override
  State<NewssApp> createState() => _NewssAppState();
}

class _NewssAppState extends State<NewssApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MagazineDetails(),
      ),
    );
  }
}
