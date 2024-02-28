import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/home/product_cart_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.category});
  final String? category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Products', style: TextStyle(
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
        );


  }
}
