import 'dart:ffi';
import 'package:e_commerce/presentation/controller_binder.dart';
import 'package:e_commerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_commerce/presentation/ui/utility/app_theme_data.dart';
import 'package:get/get.dart';
import 'package:e_commerce/presentation/ui/screens/splash_screens.dart';
import 'package:e_commerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ecomm extends StatelessWidget {
  const Ecomm({ super.key });

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme:AppThemeData.LightThemeData,
      home: SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}


