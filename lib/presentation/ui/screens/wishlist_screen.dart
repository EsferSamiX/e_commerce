import 'package:e_commerce/presentation/ui/widgets/home/product_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holders/main_bottom_nav_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
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
          title: Text('Wishlist', style: TextStyle(
            fontSize: 18,
          ),),
          elevation: 3,

        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.80,
              mainAxisSpacing: 60,
              crossAxisSpacing: 60,
              //mainAxisExtent: 400,
            ),
            itemBuilder:(context,index){
              return FittedBox(child: ProductCartItem());
            },
          ),
        ),
      ),
    );
  }
}
