import 'package:e_commerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_commerce/presentation/ui/screens/carts_screen.dart';
import 'package:e_commerce/presentation/ui/screens/category_screen.dart';
import 'package:e_commerce/presentation/ui/screens/home_screen.dart';
import 'package:e_commerce/presentation/ui/screens/wishlist_screen.dart';
import 'package:e_commerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({ super.key });

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}



class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
 // int _selectedIndex=0;
  final List<Widget> _screens=const [
    HomeScreen(),
    CategoriScreen(),
    CartScreen(),
    WishlistScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap:
              controller.changeIndex,

            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Carts'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined),label: 'Wishlist'),

            ],
          ),
        );
      }
    );
  }
}