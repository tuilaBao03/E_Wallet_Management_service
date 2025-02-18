// ignore_for_file: avoid_print, non_constant_identifier_names, file_names, unused_local_variable

import 'package:smartwalletapp/bloc/Auth/AuthEvent.dart';
import 'package:smartwalletapp/bloc/Auth/AuthState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/repository/UserRepository.dart';
import '../../models/user.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitial()){
    on<AuthenticateEvent>(_Authenticate);
    // on<ForgetPassWordEvent>(_CheckAndChangePass);
  }
  Future<User?> _Authenticate(AuthenticateEvent event,Emitter<AuthState> emit) async{
    try{
      UserRepository userRepository = UserRepository();
      AuthResult result = await userRepository.authenticate(event.password, event.username);
      print(result.code);
      print(result.token);
      if(result.code == 0){
        User user = await userRepository.giveUserByName(event.username, result.token);
        emit(AuthSuccess(user,result.token));
      }
      else{
        emit(AuthError("123456${result.code.toString()}"));
      }
    }
    catch(e){
      print("_Authenticate: $e");
      return null;
    }
    return null;
  }
}