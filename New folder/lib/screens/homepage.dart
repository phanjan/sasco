import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prosca/widgets/widget_bottom_bar.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../untils/Strings.dart';
import '../untils/colors.dart';
import '../models_room/rooms_products.dart';
import 'detail_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //appbar
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark),
            expandedHeight: 236.h,
            backgroundColor: Colors.white,
            elevation:0.0,
            //pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                BannerImage,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                height: 30.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r))),
                child: Container(),
              ),
            ),
          ),

          //body
          //1
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Center(
                child: Row(
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
                                color: Color(0xff003CA6))),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: 57.w,
                          height: 57.h,
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: BorderColor,
                                width: 1.w,
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
                    ),
                  ],
                ),
              ),
            ),
          ),

          //2
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Title2,
                    style: TextStyle(
                      color: Color(0xff019CB4),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Arial',
                      height: null
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          //3
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Hệ thống phòng chờ',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Arial',
                          color: Color(0xff000000)),
                    ),
                  ),
                  Container(
                    height: 320.h,
                    child: SizedBox(
                        child: ScrollSnapList(
                      itemBuilder: _buildListItem,
                      itemCount: productList.length,
                      itemSize: 215.sp,
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
                  ),

                  /* Container(
                      height: 100.h,
                      color: Colors.white,
                    ),*/
                ],
              ),
            ),
          ),
        ],
      ),
      //bottomNavigationBar: Widget028(),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    bool isShadowVisible = index == focusedIndex;
    /*if (index == productList.length)
      return Center(
      child: CircularProgressIndicator(),
    );*/

    return GestureDetector(
      onTap: ()
        {
          print(productList[index].id);
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(productId: productList[index].id)));
        },
      child: Container(
        width: 179.w,
        height: 279.h,
        margin: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              if (isShadowVisible)
                const BoxShadow(
                    color: Color(0xff009CA6),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 6)),
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

