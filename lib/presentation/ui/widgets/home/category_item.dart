import 'package:e_commerce/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });
  //final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(
            ()=>const ProductListScreen()
        );
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child:const Padding(
              padding: EdgeInsets.all(24.0),
              child: Icon(Icons.computer, size: 32,color: AppColors.primaryColor,),
            ),
          ),
          Text('Electronics ',style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),),
        ],
      ),
    );
  }
}