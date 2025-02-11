
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/models/user.dart';
import 'package:smartwalletapp/screens/contract/contract_screen.dart';
import 'package:smartwalletapp/screens/customer/customer_screen.dart';
import 'package:smartwalletapp/screens/myprofile/myprofile_screen.dart';
import '../../controllers/menu_app_controller.dart';
import '../../responsive.dart';
import '../authentication/login_screen.dart';
import '../authentication/register_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../setting/setting_screen.dart';
import '../transaction/transaction_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  final bool isAuth;
  final User user;
  const MainScreen({super.key,
    required this.isAuth, required this.user
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
  List<User> users = [];
  List<Transaction> trans =[];
  List<CardInfo> cards = []; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(onMenuTap: (int index) {
        setState(() {
          _currentTab = index;
        });
      }, isAuth: widget.isAuth,),
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
              }, isAuth: widget.isAuth,)),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 8,
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
        return DashboardScreen(isAuth: widget.isAuth, user: widget.user,);
      case 2:
        return CustomerScreen(isAuth: widget.isAuth, user: widget.user, users: [], trans: [], cards: [],);
      case 3: 
        return TransactionScreen(isAuth: widget.isAuth);
      case 4:
        return ContractScreen(isAuth: widget.isAuth, user: widget.user,);
      case 5:
        return MyprofileScreen(isAuth: widget.isAuth, user: widget.user);
       // Thêm màn hình SettingScreen
      default:
        return DashboardScreen(isAuth: widget.isAuth,user: widget.user,);
    }
  }
}
