import 'package:e_commerce/presentation/ui/screens/home/main_bottom_nav_screen.dart';
import 'package:e_commerce/presentation/ui/screens/verify_otp_screen.dart';
import 'package:e_commerce/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 48,),
              const AppLogo(
                height: 80,
              ),
              const SizedBox(height: 24,),
              Text('Complete Profile',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 28,
                ),),
              const SizedBox(height: 4,),
              Text('Get started with us with your details'),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'First Name',

                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Last Name'
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Mobile',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'City'
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(

                    hintText: 'Shipping Address',

                ),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 24,),
              SizedBox(
                 width: double.infinity,
                child: ElevatedButton(onPressed: (){
                Get.offAll(MainBottomNavScreen());
                },child: Text('Complete'),),
              )
            ],
          ),
        ),
      ),
    );
  }
}