// ignore_for_file: unused_import, avoid_print, non_constant_identifier_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppBloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppState.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/repository/DashboardRepository.dart';
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
  final String token;
  final bool isAuth;
  final User user;
  final Function(Locale) onLanguageChange;
  const MainScreen({super.key,
    required this.isAuth, required this.user, required this.onLanguageChange, required this.token
});
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  late User selectedUsers; 
  int _currentTab = 1;
  List<CardHolder> cardHolders = [];
  List<Contract> contracts = [];
  List<Transaction> trans =[];
  List<CardInfo> cards = [];
  List<Card_Time> card_times = [];
  @override
  void initState() {
    super.initState();
    selectedUsers = widget.user;
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
          else if(state is UpdateUserSuccessState){
            selectedUsers = state.user;
          }
          else if(state is GiveCardListState) {
            card_times = state.list;
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
              flex: 7,
              child: _getScreen(_currentTab),
            ),
          ],
        ),
      );
    
      }, listener: (context,state){
        if(state is MainAppErrorState){
          print(state.error);
        }
        else if(state is LogoutSuccess){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(isAuth: false, onLanguageChange: widget.onLanguageChange, ),
              ),
            );

        }
      })
    );
  
  
  
  }
  Widget _getScreen(int tab) {
    switch (tab) {
      case 1:
        return DashboardScreen(isAuth: widget.isAuth, user: selectedUsers, onLanguageChange: widget.onLanguageChange, card_times: card_times,);
      case 2:
        return CustomerScreen(isAuth: widget.isAuth, user: selectedUsers, cardHolders: cardHolders, trans: trans, cards: cards, contracts: contracts, onLanguageChange: widget.onLanguageChange);
      case 3: 
        return ContractScreen(isAuth: widget.isAuth, user: selectedUsers,onLanguageChange: widget.onLanguageChange,);
      case 4:
        return MyprofileScreen(isAuth: widget.isAuth, user: selectedUsers,onLanguageChange: widget.onLanguageChange, token: widget.token,);
       // Thêm màn hình SettingScreen
      default:
        return DashboardScreen(isAuth: widget.isAuth,user: selectedUsers, onLanguageChange: widget.onLanguageChange, card_times: card_times,);
    }
  }
}
