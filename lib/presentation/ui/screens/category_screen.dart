import 'package:e_commerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_commerce/presentation/ui/widgets/home/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriScreen extends StatefulWidget {
  const CategoriScreen({super.key});

  @override
  State<CategoriScreen> createState() => _CategoriScreenState();
}

class _CategoriScreenState extends State<CategoriScreen> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
       return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.cyan,
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: Text('Category', style: TextStyle(
            fontSize: 18,
          ),),
          elevation: 3,

        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            itemCount: 20,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.96,
                mainAxisSpacing: 12,
                crossAxisSpacing: 8,
              ),
              itemBuilder:(context,index){
               return FittedBox(child: CategoryItem());
              },
              ),
        ),
      ),
    );
  }
}
