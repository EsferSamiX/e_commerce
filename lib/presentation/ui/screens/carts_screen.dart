import 'package:e_commerce/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce/presentation/ui/utility/asses_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/carts/cart_product_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

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
          title: Text('Carts', style: TextStyle(
            fontSize: 18,
          ),),
          elevation: 3,

        ),
       body: Column(
         children: [
           Expanded(
               child: ListView.separated(
                 itemCount: 4,
                 itemBuilder:(contex,index){
                   return const CartProductItem();
                 },
                   separatorBuilder: (_, __)=> const SizedBox(height: 8,),
                   )
           ),
           totalPriceNCheckout,
         ],
       ),

      ),
        );
  }

  Container get totalPriceNCheckout {
    return Container(
         padding: EdgeInsets.all(16.0),
           decoration: BoxDecoration(
             color: AppColors.primaryColor.withOpacity(0.15),
             borderRadius: BorderRadius.only(
               topLeft: Radius.circular(16),
               topRight: Radius.circular(16),
             )
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Total Price',style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w600,
                     color: Colors.black45,
                   ),),
                   Text('\$1199',style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     color: AppColors.primaryColor)),
                 ],
               ),
               SizedBox(
                 width: 100,
                 child: ElevatedButton(onPressed: () {},
                     child: Text('Checkout'),),
               ),
             ],
           ),
         );
  }
}



