import 'package:crud_app/core.dart';
import 'package:flutter/material.dart';

import '../view/splash_screen_view.dart';

class SplashScreenController extends State<SplashScreenView> {
  static late SplashScreenController instance;
  late SplashScreenView view;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    });
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
