import 'package:e_commerce/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});


  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems=ValueNotifier(1);
  List<Color> colors=[
   Colors.black,
    Colors.teal,
    Colors.blueGrey,
    Colors.amber,
    Colors.red
  ];
  List<String> sizes=[
   'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];
  Color _selectedColor=Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                 const ProductImageCarousel(),
                  //const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text('iphone 15 pro max',style:
                              TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),),),
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
                        ),
                        
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.star,size: 20,
                                  color: Colors.amber,),
                                const SizedBox(width: 8,),
                                Text('4.8',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                ),),

                              ],
                            ),
                            const SizedBox(width: 8,),
                            Text('Reviews',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                            ),
                            const SizedBox(width: 8,),

                            Card(
                              color: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.favorite_outline_rounded,
                                  size: 18,
                                  color: Colors.white,),
                              ),
                            ),
                            const SizedBox(width: 8,)
                          ],
                        ),
                        Text('Color',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),),
                        ColorSelector(colors: colors,
                            onChange: (selectedColor){
                          _selectedColor=selectedColor;
                            }),
                        const SizedBox(height: 16,),
                        Text('Size', style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),),
                        SizeSelector(sizes: sizes, onChange: (s){

                        }),
                        const SizedBox(height: 8,),
                        Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys'
                            ' standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make'
                            ' a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                            'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing'
                            ' Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ) ,
                        )
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          priceNCart,
        ],
      ),
    );
  }
}

Container get priceNCart {
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
            Text('Price',style: TextStyle(
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
          width: 120,
          child: ElevatedButton(onPressed: () {},
            child: Text('Add to Cart'),),
        ),
      ],
    ),
  );
}

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.colors, required this.onChange});

  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
   late Color _selectedColor;
  void initState(){
    super.initState();
    _selectedColor=widget.colors.first;
  }


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.colors.map((c) => InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: (){
          _selectedColor=c;
          widget.onChange(c);
          if(mounted){
            setState(() {

            });
          }

        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: c,
            child: _selectedColor == c? const Icon(Icons.done,color: Colors.white): null,
          ),
        ),
      )).toList(),

    );
  }
}

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize;
  void initState(){
    super.initState();
    _selectedSize=widget.sizes.first;
  }


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.sizes.map((c) => InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: (){
          _selectedSize=c;
          widget.onChange(c);
          if(mounted){
            setState(() {

            });
          }

        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey),
            color: c == _selectedSize ? AppColors.primaryColor :null,
          ),
            child: Text(c,style: TextStyle(
              color: c == _selectedSize ? Colors.white :Colors.black45,
            ),)
        ),
      )).toList(),

    );
  }
}

