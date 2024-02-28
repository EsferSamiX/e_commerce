import 'package:e_commerce/presentation/ui/screens/verify_otp_screen.dart';
import 'package:e_commerce/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200,),
             const AppLogo(
                height: 80,
              ),
              const SizedBox(height: 24,),
              Text('Welcome back',
                style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 4,),
              Text('Please enter your email address'),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
              const SizedBox(height: 24,),
              SizedBox(
               // width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Get.to(const VerifyOtpScreen());
                },child: Text('Next'),),
              )
            ],
          ),
        ),
      ),
    );
  }
}