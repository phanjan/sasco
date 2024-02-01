import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:prosca/untils/colors.dart';

import 'HomeScreen.dart';
import 'custom_icon_bottom_bar.dart';
import '../untils/Strings.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MyTabScaffoldaaState();
}

class _MyTabScaffoldaaState extends State<MainScreen> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: _buildCupertinoTabBar(),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            Widget tabContent;
            switch (index) {
              case 0:
                tabContent = HomeScreen(
                  hideNavigation: hideNav,
                  showNavigation: showNav,
                );
                break;
              case 1:
                tabContent = SearchTab();
                break;
              case 2:
                tabContent = SettingsTab();
                break;
              case 3:
                tabContent = SearchTab();
                break;
              default:
                tabContent = Placeholder();
            }
            return _buildScrollableContent(tabContent);
          },
        );
      },
    );
  }

  Widget _buildScrollableContent(Widget content) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: content,
        ),
      ],
    );
  }

  CupertinoTabBar _buildCupertinoTabBar() {
    return CupertinoTabBar(
      items: const [
        BottomNavigationBarItem(
          icon: custom_icon_navigation_bar(
            imageIcon: HomeLine,
            title: 'Home',
            color: iconColor,
          ),
          activeIcon: custom_icon_navigation_bar(
            imageIcon: HomeFill,
            title: 'Home',
            color: activeIconColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: custom_icon_navigation_bar(
            imageIcon: QRLine,
            title: 'Quét mã',
            color: iconColor,
          ),
          activeIcon: custom_icon_navigation_bar(
            imageIcon: QRFill,
            title: 'Quét mã',
            color: activeIconColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: custom_icon_navigation_bar(
            imageIcon: ReportBoxOutline,
            title: 'Báo cáo',
            color: iconColor,
          ),
          activeIcon: custom_icon_navigation_bar(
            imageIcon: ReportBox,
            title: 'Báo cáo',
            color: activeIconColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: custom_icon_navigation_bar(
            imageIcon: ProfileBold,
            title: 'Profile',
            color: iconColor,
          ),
          activeIcon: custom_icon_navigation_bar(
            imageIcon: ProfileFill,
            title: 'Profile',
            color: activeIconColor,
          ),
        ),
      ],
      height: 82.h,
    );
  }

  void showNav() {
    setState(() {
      visible = true;
    });
  }

  void hideNav() {
    setState(() {
      visible = false;
    });
  }
}


class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Content'),
    );
  }
}

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Content'),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String productName;

  ProductDetailScreen(this.productName);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(productName),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Product Detail for $productName'),
            CupertinoButton(
              child: Text('Back to Home'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
