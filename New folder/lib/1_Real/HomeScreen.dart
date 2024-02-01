import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'horizontal_image.dart';
import '../untils/Strings.dart';
import '../untils/colors.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback showNavigation;
  final VoidCallback hideNavigation;


  const HomeScreen(
      {Key? key, required this.showNavigation, required this.hideNavigation})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ScrollController scrollController = ScrollController();

  int focusedIndex = 0;

  @override
  void initState() {
    super.initState();

    /*scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.showNavigation();
      } else {
        widget.hideNavigation();
      }
    });*/
  }

  @override
  void dispose() {
    super.dispose();

    /*scrollController.removeListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.showNavigation();
      } else {
        widget.hideNavigation();
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //controller: scrollController,
        slivers: [
          //
          //
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark),
            expandedHeight: 236.h,
            elevation: 0.0,
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
              ),
            ),
          ),

          //
          //
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              //padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              margin: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Logo +
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Row(
                      children: [
                        //logo
                        //
                        Image.asset(
                          LogoImage,
                          width: 271.w,
                          height: 71.h,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        //Quét ngay
                        //
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

                  SizedBox(
                    height: 25.h,
                  ),

                  //Title1
                  Text(
                    Title2,
                    style: TextStyle(
                        color: const Color(0xff019CB4),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Arial',
                        height: null),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(
                    height: 25.h,
                  ),

                  //Title2
                  Text(
                    'Hệ thống phòng chờ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Arial',
                        color: const Color(0xff000000)),
                  ),

                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 320.h,
              child: ImageCarouselH(),
            )  //
            ,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 320.h,
              child:Text(
                Title2,
                style: TextStyle(
                    color: const Color(0xff019CB4),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Arial',
                    height: null),
                textAlign: TextAlign.center,
              ),
            )  //
            ,
          ),
        ],
      ),
    );
  }


}