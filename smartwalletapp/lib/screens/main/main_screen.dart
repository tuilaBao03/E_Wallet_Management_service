// ignore_for_file: unused_import, avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppBloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppState.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/screens/myprofile/myprofile_screen.dart';
import 'package:smartwalletapp/screens/contract/contract_screen.dart';
import 'package:smartwalletapp/screens/customer/customer_screen.dart';
import 'package:smartwalletapp/models/transaction.dart';
import '../../controllers/menu_app_controller.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/user.dart';
import '../transaction/transaction_screen.dart';
import '../authentication/register_screen.dart';
import '../authentication/login_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'components/side_menu.dart';
import '../../responsive.dart';

class MainScreen extends StatefulWidget {
  final bool isAuth;
  final User user;
  final Function(Locale) onLanguageChange;
  const MainScreen({super.key,
    required this.isAuth, required this.user, required this.onLanguageChange
});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTab = 1;
  List<CardHolder> cardHolders = [];
  List<Contract> contracts = [];
  List<Transaction> trans =[];
  List<CardInfo> cards = []; 
  @override
  void initState() {
    super.initState();
    context.read<MainAppBloc>().add(initializationEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(onMenuTap: (int index) {
        setState(() {
          _currentTab = index;
        });
      }, isAuth: widget.isAuth,),
      body: BlocConsumer<MainAppBloc,MainAppState>(
        builder: (context,state){
          if(state is giveCardHolderListState){
            cardHolders = state.cardHolders;
          }
          else if(state is giveCardListState){
            cards = state.cardInfo;
            print("main_screen ${cards.length}");
          }
          else if(state is giveTransactionState){
            trans = state.trans;
          }
          else if(state is giveContractsListState){
            contracts = state.contracts;
          }
        return SafeArea(
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
      );
    
      }, listener: (context,state){
        if(state is MainAppError){
          print(state.error);
        }
      })
    );
  
  
  
  }
  Widget _getScreen(int tab) {
    switch (tab) {
      case 1:
        return DashboardScreen(isAuth: widget.isAuth, user: widget.user, onLanguageChange: widget.onLanguageChange);
      case 2:
        return CustomerScreen(isAuth: widget.isAuth, user: widget.user, cardHolders: cardHolders, trans: trans, cards: cards, contracts: contracts, onLanguageChange: widget.onLanguageChange);
      case 3: 
        return TransactionScreen(isAuth: widget.isAuth, user: widget.user,onLanguageChange: widget.onLanguageChange,);
      case 4:
        return ContractScreen(isAuth: widget.isAuth, user: widget.user,onLanguageChange: widget.onLanguageChange,);
      case 5:
        return MyprofileScreen(isAuth: widget.isAuth, user: widget.user,onLanguageChange: widget.onLanguageChange,);
       // Thêm màn hình SettingScreen
      default:
        return DashboardScreen(isAuth: widget.isAuth,user: widget.user, onLanguageChange: widget.onLanguageChange,);
    }
  }
}
