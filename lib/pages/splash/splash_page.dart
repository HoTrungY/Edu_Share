import 'dart:async';
import 'package:edu_share/pages/auth/login_page.dart';
import 'package:edu_share/pages/main_page.dart';
import 'package:edu_share/pages/onboarding/on_boarding_page.dart';
import 'package:edu_share/resource/img/app_images.dart';
import 'package:edu_share/resource/themes/app_colors.dart';
import 'package:edu_share/service/local/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  void _checkStatus() {
    Timer(const Duration(milliseconds: 2600), () {
      if (SharedPrefs.isAccessed) {
        if (SharedPrefs.isLogin) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false,
          );
        }
      } else {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const OnBoardingPage()),
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Center(child: SvgPicture.asset(AppImages.imageLogo)),
    );
  }
}
