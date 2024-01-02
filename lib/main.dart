import 'dart:io';

import 'package:crud_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyCyz7kEh0BRvmrIwCggvraSR8RGFznCz4o',
              appId: '1:159871794675:android:40c62cbe4af090805ea686',
              messagingSenderId: '159871794675',
              projectId: 'joki-pam'))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
