// ignore_for_file: avoid_print, file_names, non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/main_app_event.dart';
import 'package:smartwalletapp/bloc/MainApp/main_app_state.dart';
import 'package:smartwalletapp/request/user.dart';
import 'package:smartwalletapp/repository/userRepository.dart';
import 'package:smartwalletapp/repository/authRepository.dart';


class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  MainAppBloc() : super(MainInitial()) {
    on<UpdateUserInforEvent>(_updatedUserInfor);
    on<LogoutEvent>(_logout);

  }


  void _updatedUserInfor(UpdateUserInforEvent event, Emitter<MainAppState> emit) async{
    try {
      User user = event.user;
      final UserRepository userRepository = UserRepository();
      user = await userRepository.updatedUser(user,event.token);
      emit(
        UpdateUserSuccessState(user)
      );
    }
    catch(e){
      print("_updatedUserInfor $e");
    }
  }
  void _logout(LogoutEvent event, Emitter<MainAppState> emit) async{
    final AuthenRepository authRepository = AuthenRepository();
    authRepository.logout();
    emit(
      LogoutSuccess()
    );
  }
  }




