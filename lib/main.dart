import 'package:data_book/providers/data_provider.dart';
import 'package:data_book/screens/home_screen/home_screen.dart';
import 'package:data_book/screens/splash_screen/splash_screen.dart';
import 'package:data_book/utilities/app_colors.dart';
import 'package:data_book/utilities/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DataProvider()),
        // ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Data Book',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: const SplashScreen(),
        routes: <String, WidgetBuilder>{
          AppRoutes.splashRoute: (context) => const SplashScreen(),
          AppRoutes.homeScreenRoute: ((context) => const HomeScreen()),
        },
      ),
    );
  }
}

ThemeData appTheme() {
  return ThemeData(
      primarySwatch: AppColors.primarySwatch,
      primaryColor: AppColors.primaryColor,
      dividerColor: AppColors.grey,
      // colorScheme: ColorScheme(secondary:AppColors.primaryColor ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.black,
          selectionColor: AppColors.primaryColor,
          selectionHandleColor: AppColors.primaryColor),
      unselectedWidgetColor: AppColors.grey,
      iconTheme: const IconThemeData(color: Colors.white, size: 15),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: AppColors.black,
            fontSize: 26.0,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.normal),
        displayMedium: TextStyle(color: AppColors.black, fontSize: 14.0),
        bodyMedium: TextStyle(color: AppColors.black),
        displayLarge: TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.normal),
        displaySmall: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.normal),
        labelSmall: TextStyle(
            color: AppColors.red,
            fontSize: 13.0,
            fontWeight: FontWeight.normal),
        labelLarge: TextStyle(
            color: AppColors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.normal),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
        primaryColor: AppColors.primaryColor,
      )),
      fontFamily: 'Circular Std');
}
