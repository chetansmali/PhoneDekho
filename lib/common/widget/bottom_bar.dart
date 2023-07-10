import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonedekho/constants/global_vareables.dart';
import 'package:badges/badges.dart' as badges;
import 'package:phonedekho/features/account/screens/account_screen.dart';
import 'package:phonedekho/features/home/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth =42;
  double bottomBarBoarderWidth =5;

  List<Widget> pages =[
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart page'),
    ),

  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [

          //Home bottom nav
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 0 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor,
                width: bottomBarBoarderWidth,
              ))
            ),
            child: const Icon(Icons.home_outlined),
          ),
            label: '',
          ),

          //Profile bottom nva
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page == 1 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor,
                  width: bottomBarBoarderWidth,
                ))
            ),
            child: const Icon(Icons.person_2_outlined),
          ),
            label: '',
          ),

          //Cart bottom nav
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page == 2 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor,
                  width: bottomBarBoarderWidth,
                ))
            ),
            child: badges.Badge(
              badgeContent:const Text('2'),
              badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.white,
                  elevation: 0 ),
              child: const Icon(
                  Icons.shopping_cart_outlined),
            ),
          ),
            label: '',
          ),
        ],
      ),

    );
  }
}
