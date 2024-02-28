import 'package:e_commerce/presentation/ui/screens/verify_email_screen.dart';
import 'package:e_commerce/presentation/ui/utility/asses_path.dart';
import 'package:e_commerce/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ super.key });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async{
   await Future.delayed(Duration(seconds: 2));
   Get.offAll(const VerifyEmailScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            AppLogo(),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 16,),
            const Text('Version 1.0'),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}