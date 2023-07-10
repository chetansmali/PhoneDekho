import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonedekho/common/widget/bottom_bar.dart';
import 'package:phonedekho/features/admin/screens/add_product_screen.dart';
import 'package:phonedekho/features/auth/screen/auth_screen.dart';
import 'package:phonedekho/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name) {
    case AuthScreen.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case BottomBar.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );

    case AddProductScreen.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    default : return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Screen dosen\'t exist'),
        ),
      ),
    );
  }
}