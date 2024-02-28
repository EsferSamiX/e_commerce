import 'package:e_commerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_commerce/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../utility/asses_path.dart';
import '../widgets/home/BannerCarousel.dart';
import '../widgets/home/category_item.dart';
import '../widgets/home/circle_icon_button.dart';
import '../widgets/home/product_cart_item.dart';
import '../widgets/home/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              searchTextField,
              const SizedBox(height: 16,),
              const BannerCarousel(),
              const SizedBox(height: 16,),
               SectionTitle(
                title:'All Categories',
                 onTapSeeAll: (){
                 Get.find<MainBottomNavController>().changeIndex(1);
                 },
              ),
              categoryList,
              SectionTitle(
                title:'Popular',
                onTapSeeAll: (){
                 Get.to(()=>const ProductListScreen());
                },
              ),
              ProductList,
              const SizedBox(height: 8,),
              SectionTitle(
                title:'Special',
                onTapSeeAll: (){

                },
              ),
              ProductList,
              const SizedBox(height: 8,),
              SectionTitle(
                title:'New',
                onTapSeeAll: (){

                },
              ),
              ProductList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
              height: 130,
              child: ListView.separated(
                itemCount: 10,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) {
                  return const CategoryItem();
                }, separatorBuilder: (_, __) {
                  return const SizedBox(width: 8,);
              },
              ),
            );
  }
  SizedBox get ProductList {
    return SizedBox(
      height: 265,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return  ProductCartItem();
        }, separatorBuilder: (_, __) {
        return const SizedBox(width: 8,);
      },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: const Icon(Icons.search, color: Colors.grey,),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)
                ),
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            );
  }
  AppBar get appBar{
    return AppBar(
     // backgroundColor: Colors.,
      //elevation: none,
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CirculericonButton(
          onTap: (){},
          iconData: Icons.person,
        ),
        const SizedBox(width: 8,),
        CirculericonButton(
          onTap: (){},
          iconData: Icons.call,
        ),
        const SizedBox(width: 8,),
        CirculericonButton(
          onTap: (){},
         iconData: Icons.notifications_active_outlined,
        ),
      ],
    );
  }
}








