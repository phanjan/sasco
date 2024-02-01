import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../models_room/rooms_products.dart';
import '../untils/Strings.dart';
import '../untils/colors.dart';
import 'detail_model.dart';

class HomePageR extends StatefulWidget {
  const HomePageR({super.key});

  @override
  State<HomePageR> createState() => _HomePageRState();
}

class _HomePageRState extends State<HomePageR> {

  int focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  height: 236.h,
                  child: Image.asset(BannerImage, fit: BoxFit.cover),
                )),
            Positioned(
                left: 0,
                top: 211.h,
                right: 0,
                child: SingleChildScrollView(
                  child: Container(
                    height: 602.h,
                    width: 428.w,
                   // margin: EdgeInsets.symmetric(vertical: 16.w),
                    padding: EdgeInsets.only(top: 30.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.r),
                          topLeft: Radius.circular(30.r),
                        ),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  
                        //Logo
                        Container(
                          width: 355.w,
                          height: 77.h,
                          margin: EdgeInsets.symmetric(horizontal:  36.5.w),
                  
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                LogoImage,
                                width: 271.w,
                                height: 71.h,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                children: [
                                  Text('Quét ngay',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13.sp,
                                          fontFamily: 'Arial',
                                          color: const Color(0xff003CA6))),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    width: 52.w,
                                    height: 55.h,
                                    padding: EdgeInsets.all(3.sp),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: BorderColor,
                                          width: 1.2.w,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          ScanImage,
                                          width: 18.w,
                                          height: 18.h,
                                        )),
                                  ),
                                ],
                              )
                  
                            ],
                          ),
                        ),
                  
                        SizedBox(height: 25.h,),
                  
                        Container(
                          height: 105.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            Title2,
                            style: TextStyle(
                                color: const Color(0xff019CB4),
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Arial',
                                height: null
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                  
                        SizedBox(height: 25.h,),
                  
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                                'Hệ thống phòng chờ',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Arial',
                                    color: const Color(0xff000000)),
                              ),
                          ),
                  
                        Container(
                          height: 310.h,
                          child: SizedBox(
                              child: ScrollSnapList(
                                itemBuilder: _buildListItem,
                                itemCount: productList.length,
                                itemSize: 200.sp,
                                onReachEnd: () {
                                  print('Done!');
                                },
                                onItemFocus: (int index) {
                                  setState(() {
                                    focusedIndex = index;
                                  });
                                  print('${productList[index]}');
                                },
                                dynamicItemSize: true,
                              )),
                        )
                  
                  
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    bool isShadowVisible = index == focusedIndex;
    if (index == productList.length)
      return  Center(
      child: CircularProgressIndicator(),
    );

    return GestureDetector(
      onTap: ()
      {
        print(productList[index].id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(productId: productList[index].id)));
      },
      child: Container(
        width: 179.w,
        height: 279.h,
        margin: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              if (isShadowVisible)
                const BoxShadow(
                    color: Color(0xff009CA6),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0,5)),
            ],
            image: DecorationImage(
              image: AssetImage(product.imagePath),
              fit: BoxFit.cover,
            )),
        child: Text(
          product.title,
          style: const TextStyle(fontSize: 15),
        )
        /*Column(
              children: [
                Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,

                ),
                */ /*const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 15),
                ),*/ /*
              ],
            )*/
        ,
      ),
    );
  }
}
