// ignore_for_file: avoid_print, non_constant_identifier_names, file_names

import 'package:smartwalletapp/bloc/Auth/AuthEvent.dart';
import 'package:smartwalletapp/bloc/Auth/AuthState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/repository/UserRepository.dart';

import '../../models/user.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitial()){
    on<AuthenticateEvent>(_Authenticate);

  }
  Future<User?> _Authenticate(AuthenticateEvent event,Emitter<AuthState> emit) async{
    try{
      UserRepository userRepository = UserRepository();
      bool check = await userRepository.Authenticate(event.username, event.password);
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
}