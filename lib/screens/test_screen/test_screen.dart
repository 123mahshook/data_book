import 'package:data_book/app/contracts/convert_services.dart';
import 'package:data_book/utilities/app_colors.dart';
import 'package:data_book/utilities/font_utils.dart';
import 'package:data_book/utilities/size_utils.dart';
import 'package:data_book/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    int _count = 0;

    void increment() {
      _count++;
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Container(
              height: SizeUtils.getScreenHeight(),
              width: SizeUtils.getScreenWidth(),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeUtils.getHeight(60),
                    width: SizeUtils.getWidth(60),
                    child: IconButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: AppColors.darkGreen,
                        )),
                  ),
                  verticalSpace(20),
                  SizedBox(
                    height: SizeUtils.getHeight(140),
                    width: SizeUtils.getWidth(140),
                    child: IconButton(
                        onPressed: (() {
                          Provider.of<MyCounter>(context, listen: false)
                              .incrementCounter();
                        }),
                        icon: Icon(
                          Icons.add,
                          color: AppColors.darkGreen,
                        )),
                  ),
                  verticalSpace(30),
                  Consumer<MyCounter>(
                    builder: (context, count, _) =>
                        Text(ConvertService.convertString(count._counter)),
                  ),
                  verticalSpace(30),
                  SizedBox(
                    height: SizeUtils.getHeight(140),
                    width: SizeUtils.getWidth(140),
                    child: IconButton(
                        style: IconButton.styleFrom(
                            foregroundColor: AppColors.red,
                            backgroundColor: AppColors.red),
                        onPressed: (() {
                          Provider.of<MyCounter>(context, listen: false)
                              .decrementCounter();
                        }),
                        icon: Text(
                          "-",
                          style: FontUtils.getFont20Style(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ],
              ),
            )));
  }
}

class MyCounter with ChangeNotifier {
  int _counter = 0;

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
