import 'package:evento/constants/colors.dart';
import 'package:evento/controller/getx_controller.dart';
import 'package:evento/screen/authentication_screens/login/login_home.dart';
import 'package:evento/screen/authentication_screens/register/register_section_one.dart';
import 'package:evento/screen/authentication_screens/register/register_section_two.dart';
import 'package:evento/screen/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(EventoController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evento - We build smiles',
        theme: ThemeData(
          primaryColor: primaryColor
        ),
        home: const SplashScreen(),
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/login', page: () => LoginHome()),
          GetPage(name: '/reg1', page: () => RegisterSectionOne()),
        ],
      ),
      designSize: const Size(375, 812),
    );
  }
}
