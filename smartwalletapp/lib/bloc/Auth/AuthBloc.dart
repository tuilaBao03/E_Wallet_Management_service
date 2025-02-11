// ignore_for_file: avoid_print, non_constant_identifier_names, file_names, unused_local_variable

import 'package:smartwalletapp/bloc/Auth/AuthEvent.dart';
import 'package:smartwalletapp/bloc/Auth/AuthState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/repository/UserRepository.dart';
import '../../models/user.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitial()){
    on<AuthenticateEvent>(_Authenticate);
    on<ForgetPassWordEvent>(_CheckAndChangePass);
  }
  Future<User?> _Authenticate(AuthenticateEvent event,Emitter<AuthState> emit) async{
    try{
      UserRepository userRepository = UserRepository();
      print('----------------------------------------');
      bool check = await userRepository.Authenticate(event.username, event.password);
      print(check);
      if(check){
        User? user = await userRepository.findUserByUserName(event.username);
        emit(AuthSuccess(user!));
      }
      else{
        emit(AuthError("Wrong password or username"));
      }
    }
    catch(e){
      print("_Authenticate: $e");
      return null;
    }
    return null;
  }
  Future<void> _CheckAndChangePass(ForgetPassWordEvent event,Emitter<AuthState> emit) async{
    try{
      UserRepository userRepository = UserRepository();
      String check = await userRepository.GiveInfortoEmail(event.email);
      if(check == '0'){
        emit(AuthError("Email ko lien ket voi tk"));
      }
      else{
        emit(RegisterSuccess(true));
      }

    }
    catch(e){
      print("_CheckAndChangePass $e");
    }
  }
}