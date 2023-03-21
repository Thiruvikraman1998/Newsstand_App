import 'package:flutter/material.dart';

import 'screens.dart/magazine_details.dart';
import 'dart:ffi';

void main(List<String> args) {
  runApp(const NewssApp());
}

class NewssApp extends StatefulWidget {
  const NewssApp({super.key});

  @override
  State<NewssApp> createState() => _NewssAppState();
}

class _NewssAppState extends State<NewssApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MagazineDetails(),
      ),
    );
  }
}
