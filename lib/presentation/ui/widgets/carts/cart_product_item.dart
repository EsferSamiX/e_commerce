import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';
import '../../utility/asses_path.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  ValueNotifier<int> noOfItems=ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(AssetsPath.pdImage,width: 100,),
          const SizedBox(width: 8,),
          Expanded(
            child: Column(

              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('iPhone 15 pro max',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),),
                          Row(
                            children: [
                              Text('Color: Natural Titanium ,'),
                              const SizedBox(width: 8,),
                              Text(' 256GB'),
                            ],
                          )


                        ],
                      ),
                    ),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.delete))

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$1199',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                    ),
                    ValueListenableBuilder(
                        valueListenable: noOfItems,
                        builder: (context,value,_) {
                          return ItemCount(
                            initialValue: value,
                            minValue: 1,
                            maxValue: 20,
                            decimalPlaces: 0,
                            onChanged: (value) {
                              // Handle counter value changes
                              //print('Selected value: $value');
                              noOfItems.value=value.toInt();
                            },
                          );
                        }
                    ),
                  ],
                )
              ],

            ),
          ),
        ],
      ),
    );
  }
}