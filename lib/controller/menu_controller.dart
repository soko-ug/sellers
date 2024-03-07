import 'package:sokosellers/view/screens/history/history_screen.dart';
import 'package:sokosellers/view/screens/home/home_screen.dart';
import 'package:sokosellers/view/screens/home/sokoHome.dart';
import 'package:sokosellers/view/screens/notification/notification_screen.dart';
import 'package:sokosellers/view/screens/profile/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sokosellers/view/sokoScreens/pages/Hometabs.dart';
import 'package:sokosellers/view/sokoScreens/pages/hubPage.dart';
import 'package:sokosellers/view/sokoScreens/pages/ordersPage.dart';
import 'package:sokosellers/view/sokoScreens/pages/shopPage.dart';

class MenuItemController extends GetxController implements GetxService{
  int _currentTab = 0;
  int get currentTab => _currentTab;



  final List<Widget> screen = [
    HomeTab(),
    OrdersPage(),
    ShopPage(),
    HubPage()

  ];
  Widget _currentScreen =  HomeTab();
  Widget get currentScreen => _currentScreen;

  resetNavBar(){
    _currentScreen =  HomeTab();
    _currentTab = 0;
  }

  selectHomePage({bool isUpdate = true}) {
    _currentScreen =  HomeTab();
    _currentTab = 0;
    if(isUpdate) {
      update();
    }
  }

  selectOrdersPage() {
    _currentScreen = OrdersPage();
    _currentTab = 1;
    update();
  }

  selectShopPage() {
    _currentScreen = ShopPage();
    _currentTab = 2;
    update();
  }

  selectHubPage() {
    _currentScreen = HubPage();
    _currentTab = 3;
    update();
  }

   selectHistoryPage() {
    _currentScreen = ShopPage();
    _currentTab = 1;
    update();
  }

  selectNotificationPage() {
    _currentScreen = const NotificationScreen();
    _currentTab = 2;
    update();
  }

  selectProfilePage() {
    // _currentScreen = const ProfileScreen();
    _currentTab = 3;
    update();
  }
}
