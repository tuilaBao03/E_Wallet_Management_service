
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartwalletapp/transaction/transaction_screen.dart';

import '../../controllers/menu_app_controller.dart';
import '../../responsive.dart';
import '../authentication/login_screen.dart';
import '../authentication/register_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../setting/setting_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  final bool isAuth;
  const MainScreen({super.key,
    required this.isAuth
});


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTab = 1;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(onMenuTap: (int index) {
        setState(() {
          _currentTab = index;
        });
      }),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(child: SideMenu(onMenuTap: (int index) {
                setState(() {
                  _currentTab = index;
                });
              })),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: _getScreen(_currentTab),
            ),
          ],
        ),
      ),
    );
  }
  Widget _getScreen(int tab) {
    switch (tab) {
      case 1:
        return DashboardScreen(isAuth: widget.isAuth);
      case 2:
        return TransactionScreen(isAuth: widget.isAuth); // Thêm màn hình SettingScreen
      default:
        return DashboardScreen(isAuth: widget.isAuth);
    }
  }
}
