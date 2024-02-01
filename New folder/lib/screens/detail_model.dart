import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prosca/untils/colors.dart';
import '../models_room/rooms_products.dart';
import '../untils/Strings.dart';

Product getProductById(String id) {
  return productList.firstWhere((product) => product.id == id);
}

class ProductDetailPage extends StatelessWidget {
  final String productId;

  ProductDetailPage({required this.productId});


  @override
  Widget build(BuildContext context) {
    Product product = getProductById(productId);



    return Scaffold(
        backgroundColor: backgroundColorHome2,
        body: CustomScrollView(
          slivers: [
//1
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark),
              expandedHeight: 519.h,
              elevation: 0.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              leading: GestureDetector(
                onTap: () {
                  print('taped');
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.h, left: 16.w),
                  child: SvgPicture.asset(
                    backIcon,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
              ),
            ),

            //2
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 23.h, left: 16.w, right: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GIỜ MỞ CỬA',
                      style: TextStyle(
                          color: titleColor,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Mở cửa : 08:00 - 03:00 ngày hôm sau',
                        style: TextStyle(
                            color: subTitleColor,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'THÔNG TIN',
                      style: TextStyle(
                          color: titleColor,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Địa điểm : Sân bay Cam Ranh - Ga đi Quốc Tế',
                        style: TextStyle(
                            color: subTitleColor,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Vị trí : Tầng 2, đối diện cổng 1, 2, 3',
                        style: TextStyle(
                            color: subTitleColor,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Số giờ sử dụng : 3 giờ',
                        style: TextStyle(
                            color: subTitleColor,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Dịch vụ và tiện ích',
                      style: TextStyle(
                          color: titleColor,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
