import 'package:flutter/material.dart';
import 'package:riverpod_example/view/basket/basket.dart';
import 'package:riverpod_example/view/favorite/favorite.dart';
import 'package:riverpod_example/view/home/home.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Anasayfa',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favoriler',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket_outlined),
      label: 'Sepet',
    ),
  ];
  int currentIndex = 0;
  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String appBarTitle() {
    switch (currentIndex) {
      case 0:
        return 'Anasayfa';
      case 1:
        return 'Favoriler';
      case 2:
        return 'Sepet';
      default:
        return 'Anasayfa';
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return Home();
      case 1:
        return Favorite();
      case 2:
        return Basket();
      default:
        return Home();
    }
  }
}
