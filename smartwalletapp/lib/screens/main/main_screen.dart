// ignore_for_file: unused_import, avoid_print, non_constant_identifier_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/main_app_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/main_app_event.dart';
import 'package:smartwalletapp/bloc/MainApp/main_app_state.dart';
import 'package:smartwalletapp/models/create_cardholder_request.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/repository/dashboardRepository.dart';
import 'package:smartwalletapp/screens/general/dialogAlert.dart';
import 'package:smartwalletapp/screens/myprofile/myprofile_screen.dart';
import 'package:smartwalletapp/screens/contract/contract_screen.dart';
import 'package:smartwalletapp/screens/customer/customer_screen.dart';
import '../../controllers/menu_app_controller.dart';
import 'package:smartwalletapp/models/create_card_request.dart';
import 'package:smartwalletapp/models/user.dart';
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
  @override
  void initState() {
    super.initState();
    selectedUsers = widget.user;
    context.read<MainAppBloc>().add(initializationEvent(_currentTab-1));
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
        
          if(state is UpdateUserSuccessState){
            selectedUsers = state.user;
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
          InputDialog.showError(
            context,
            title: 'Thông báo lỗi',
            content: state.message,
          );
        }
        else if(state is LogoutSuccess){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(isAuth: false, onLanguageChange: widget.onLanguageChange, ),
              ),
            );

        }
        else if(state is SuccessState){
          InputDialog.showSuccess(
            context,
            title: 'Thông báo thành công',
            content: state.message,
          );
        }
      })
    );
  
  
  
  }
  Widget _getScreen(int tab) {
    switch (tab) {
      // case 1:
      //   return DashboardScreen(isAuth: widget.isAuth, user: selectedUsers, onLanguageChange: widget.onLanguageChange, card_times: card_times,);
      case 2:
        return CustomerScreen(isAuth: widget.isAuth, user: selectedUsers, onLanguageChange: widget.onLanguageChange, token: widget.token,);
      case 3: 
        return ContractScreen(isAuth: widget.isAuth, user: selectedUsers,onLanguageChange: widget.onLanguageChange, token:widget.token,);
      case 4:
        return MyprofileScreen(isAuth: widget.isAuth, user: selectedUsers,onLanguageChange: widget.onLanguageChange, token: widget.token,);
       // Thêm màn hình SettingScreen
      default:
        // return DashboardScreen(isAuth: widget.isAuth,user: selectedUsers, onLanguageChange: widget.onLanguageChange, card_times: card_times,);
         return CustomerScreen(isAuth: widget.isAuth, user: selectedUsers, onLanguageChange: widget.onLanguageChange, token: widget.token,);
    }
  }
}
