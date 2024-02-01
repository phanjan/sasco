import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prosca/untils/Strings.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../models_room/rooms_products.dart';
import '../screens/detail_model.dart';


class DynamicHorizontalDemo extends StatefulWidget {
  @override
  _DynamicHorizontalDemoState createState() => _DynamicHorizontalDemoState();
}

class _DynamicHorizontalDemoState extends State<DynamicHorizontalDemo> {
  int _focusedIndex = 0;

  @override
  void initState() {
    super.initState();

  }

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      _focusedIndex = index;
    });
  }


  Widget _buildListItem(BuildContext context, int index) {

    Product product = productList[index];
    bool isShadowVisible = index == _focusedIndex;

    if (index == productList.length)
      return Center(child: CircularProgressIndicator(),);

    //horizontal
    return Container(
      width: 150,
      child:
      GestureDetector(
            onTap: (){
              print('tap');
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(productId: productList[index].id)));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h,top: 10.h),
              padding: EdgeInsets.only(top: 5.h),
              width: 209.w,
              height: 279.h,
              // margin: EdgeInsets.all(15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    if (isShadowVisible)
                      const BoxShadow(
                          color: Color(0xff019CB4),
                          blurRadius: 12,
                          spreadRadius: 0.1,
                          offset: Offset(0,5)),
                  ],
                  image: DecorationImage(
                    image: AssetImage(product.imagePath),
                    fit: BoxFit.cover,
                  )
              ),
              child: Text(
                product.title,
                style: const TextStyle(fontSize: 15),
              )

              ,
            ),
          )
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body:
              Container(
                height: 300.h,
                child: ScrollSnapList(
                  onItemFocus: _onItemFocus,
                  itemSize: 150,
                  itemBuilder: _buildListItem,
                  itemCount: productList.length,
                  dynamicItemSize: true,
                  // dynamicSizeEquation: customEquation, //optional
                ),
              ),
      ),
    );
  }
}