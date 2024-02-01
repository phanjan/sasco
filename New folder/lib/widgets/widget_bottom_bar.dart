import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prosca/screens/home_page.dart';
import 'package:prosca/screens/homepage.dart';

class Widget028 extends StatefulWidget {
  const Widget028({super.key});

  @override
  State<Widget028> createState() => _Widget028State();
}

class _Widget028State extends State<Widget028> {
  int _currentIndex = 0;
  List<Widget> body = const [
    HomePageR(),
    Icon(Icons.menu),
    Icon(Icons.h_mobiledata),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        selectedItemColor:  Color(0xff003CA6)  ,
        unselectedItemColor: Color(0xff989898),
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? SvgPicture.asset('assets/images/ri_home-fill.svg')
                : SvgPicture.asset('assets/images/ri_home-line.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? SvgPicture.asset('assets/images/ri_qr-scan-fill.svg')
                  : SvgPicture.asset('assets/images/ri_qr-scan-line.svg'),
              label: 'Quét mã'),
          BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? SvgPicture.asset('assets/images/mdi_report-box.svg')
                  : SvgPicture.asset(
                      'assets/images/mdi_report-box-outline.svg'),
              label: 'Báo cáo'),
          BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? SvgPicture.asset('assets/images/iconamoon_profile-fill.svg')
                  : SvgPicture.asset(
                      'assets/images/iconamoon_profile-bold.svg'),
              label: 'Profile'),
        ],

      ),
    );
  }
}
