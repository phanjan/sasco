import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/detail_model.dart';
import '../untils/Strings.dart';


class ImageCarouselH extends StatefulWidget {
  @override
  State<ImageCarouselH> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarouselH> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  CarouselSlider(
          options: CarouselOptions(
            height: 310,
             aspectRatio: 16 / 9,
            viewportFraction: 0.5,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            enlargeCenterPage: true,
            enlargeFactor: 0.3.sp,
            reverse: false,
            onPageChanged: (index, reason){
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: productList.map((image) {
            return GestureDetector(
              onTap: (){
                print('tap');
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(productId: image.id)));

                /*Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(productId: image.id)));*/
              },
              child: Container(
                margin: EdgeInsets.only(left: 8.w,right:8.w, top: 10.h,bottom: 20.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image.imagePath,

                    ),
                    fit: BoxFit.cover,

                  ),
                  boxShadow: [
                    if (currentIndex == productList.indexOf(image))
                      const BoxShadow(
                          color: Color(0xff009CA6),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(0, 6)),
                  ],
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            );
          }).toList(),
        ),
    );
  }
}
