import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_time/Controller/slider_controller.dart';
import 'package:focus_time/Controller/time_controller.dart';
import 'package:focus_time/route.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const FocusTime());
}

class FocusTime extends StatelessWidget {
  const FocusTime({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.teal,
    ));

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final SliderController sliderController = Get.put(SliderController());
          final TimerController timerController = Get.put(TimerController());
          return GetMaterialApp(
            title: 'Smart Tourism',
            debugShowCheckedModeBanner: false,
            routes: routes,
            initialRoute: AppRoute.home,
          );
        });
  }
}
