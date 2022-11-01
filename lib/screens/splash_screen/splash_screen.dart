import 'package:data_book/screens/splash_screen/splash_screen_vm.dart';
import 'package:data_book/utilities/app_colors.dart';
import 'package:data_book/utilities/app_routes.dart';
import 'package:data_book/utilities/font_utils.dart';
import 'package:data_book/utilities/size_utils.dart';
import 'package:data_book/utilities/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  SplashScreenVM viewModel = SplashScreenVM();
  @override
  void initState() {
    super.initState();
    // navigateHome();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    SizeUtils.setSize(screenHeight, screenWidth);
    viewModel.setContext(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Container(
              height: screenHeight,
              width: screenWidth,
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.getWidthonSplash(24, screenWidth),
                vertical: SizeUtils.getHeightonSplash(24, screenHeight),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    Utils.getAssetPng("logo_splash"),
                    height: SizeUtils.getHeightonSplash(280, screenHeight),
                  ),
                  const Spacer(),
                  Text(
                    "Quality with Standards",
                    style: FontUtils.getFont12Style(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )));
  }

  Future<void> navigateHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRoute);
  }
}
