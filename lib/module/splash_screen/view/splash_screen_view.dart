import 'package:crud_app/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/splash_screen_controller.dart';

class SplashScreenView extends StatefulWidget {
  final Widget? child;
  const SplashScreenView({Key? key, this.child}) : super(key: key);

  Widget build(context, SplashScreenController controller) {
    controller.view = this;
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Inventory',
            style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1a2e35)),
            children: [
              TextSpan(
                text: 'App',
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffff4f5a),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<SplashScreenView> createState() => SplashScreenController();
}
