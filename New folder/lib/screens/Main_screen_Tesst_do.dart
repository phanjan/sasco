
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prosca/untils/Strings.dart';
import '../1_Real/HomeScreen.dart';
import '../1_Real/custom_icon_bottom_bar.dart';

class MainScreenA extends StatefulWidget {
  const MainScreenA({Key? key}) : super(key: key);

  @override
  State<MainScreenA> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreenA> {
  bool visible = true;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(
            hideNavigation: hideNav,
            showNavigation: showNav,
          ),
          Container(
            child: Center(child: Text('2')),
          ),
          Container(
            child: Text('3'),
          ),
          Container(
            child: Text('4'),
          ),

        ],
      ),
      bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          height: visible ? 82.h : 0,
          child: Wrap(
            children: [
              BottomNavigationBar(
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                items: [
                  /*BottomNavigationBarItem(
                      icon: custom_icon_navigation_bar(
                        currentIndex: currentIndex,
                        currentIndexI: 0,
                        Image1: HomeFill,
                        Image2: HomeLine,
                        title: 'Home',
                      ),
                    label: ''
                  ),
                  BottomNavigationBarItem(
                      icon: custom_icon_navigation_bar(
                        currentIndex: currentIndex,
                        currentIndexI: 1,
                        Image1: QRFill,
                        Image2: QRLine,
                        title: 'Quét mã',
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: custom_icon_navigation_bar(
                        currentIndex: currentIndex,
                        currentIndexI: 2,
                        Image1: ReportBox,
                        Image2: ReportBoxOutline,
                        title: 'Báo cáo',
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: custom_icon_navigation_bar(
                        currentIndex: currentIndex,
                        currentIndexI: 3,
                        Image1: ProfileFill,
                        Image2: ProfileBold,
                        title: 'Profile',
                      ),
                      label: ''),*/
                  ],
              ),
            ],
          ),
        ),

    );
  }

  void hideNav() {
    setState(() {
      visible = false;
    });
  }

  void showNav() {
    setState(() {
      visible = true;
    });
  }
}







