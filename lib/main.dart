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

/* 
//
//
// Future provider Example
//
//

void main() {
  runApp(
    Provider<Person>(
      create: (_) => Person(name: 'Jhone Doe', age: 25),
      child: FutureProvider<String>(
        create: (context) => Home().fetchAddress,
        initialData: "fetching address...",
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Consumer<Person>(
            builder: (context, Person person, child) {
              return Column(
                children: <Widget>[
                  Text("User profile:"),
                  Text("name: ${person.name}"),
                  Text("age: ${person.age}"),
                  Consumer<String>(builder: (context, String address, child) {
                    return Text("address: $address");
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Person {
  Person({this.name, this.age});

  final String? name;
  int? age;
}

class Home {
  final String city = "Portland";

  Future<String> get fetchAddress {
    final address = Future.delayed(Duration(seconds: 20), () {
      return '1234 North Commercial Ave.';
    });

    return address;
  }
} */

/* //
//
// Stream Provider Example
//
//

void main() {
  runApp(
    StreamProvider<String>(
      create: (_) => Person(name: 'Jhone Doe', initialAge: 25).age,
      initialData: 25.toString(),
      catchError: (_, error) => error.toString(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Consumer<String>(
            builder: (context, String age, child) {
              return Column(
                children: <Widget>[
                  Text("Watch Jhone Age..."),
                  Text("name: Jhone Doe"),
                  Text("age: $age"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Person {
  Person({this.name, this.initialAge});

  final String? name;
  final int? initialAge;

  Stream<String> get age async* {
    var i = initialAge!;
    while (i < 85) {
      await Future.delayed(Duration(seconds: 1), () {
        i++;
      });
      yield i.toString();
    }
  }
}
 */