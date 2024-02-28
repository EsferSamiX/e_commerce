import 'package:e_commerce/presentation/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120,),
              const AppLogo(
                height: 80,
              ),
              const SizedBox(height: 24,),
              Text('Enter OTP Code',
                style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 4,),
              Text('A 4 digit otp code has been sent'),
              const SizedBox(height: 24,),
             PinCodeTextField(
               length: 4,
                 obscureText: false,
               animationType: AnimationType.fade,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               keyboardType: TextInputType.number,
               pinTheme: PinTheme(
                 shape: PinCodeFieldShape.box,
                 borderRadius: BorderRadius.circular(5),
                 fieldHeight: 50,
                 fieldWidth: 40,
                 activeFillColor: Colors.transparent,
                 inactiveFillColor: Colors.transparent,
                 inactiveColor: AppColors.primaryColor,
                 selectedFillColor: Colors.transparent,
                 selectedColor: Colors.purple,
               ),
               animationDuration:const Duration(milliseconds: 300),
               //backgroundColor: Colors.blue.shade50,
               enableActiveFill: true,

               onCompleted: (v) {
                 print('Completed');
               },
               appContext: context,
             ),
              const SizedBox(height: 24,),

              SizedBox(
                // width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Get.to(CompleteProfileScreen());
                },child: Text('Next'),),
              ),
              const SizedBox(height: 24,),
              RichText(text: TextSpan(
                style: TextStyle(
                  color: Colors.grey,
                ),
                  children:[
                    TextSpan(
                      text: 'This code will expire '
                    ),
                    TextSpan(
                      text: '120s',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ] )),
              TextButton(onPressed: (){}, child: Text('Resend Code'),),
              //const SizedBox(height: 24,),

            ],
          ),
        ),
      ),
    );
  }
}